-- Deploy sqitch_mars:clean-saved-posts-view to pg
-- requires: clean-collection-tabs

BEGIN;

-- One row per saved post (keyed by Instagram shortcode), combining:
--   rawstd.insta_download_saved_reels          every save from the exports (2024 + 2026 layouts)
--   rawstd.insta_download_saved_reels_details  captions/hashtags/owner from the 2026 export
--   clean.insta_saved_reels (+ insta_user)     1,000 posts from the 2024 API scrape (captions, geotags)
CREATE VIEW clean.saved_posts AS
WITH saves AS (
    SELECT substring(reel_url FROM 'instagram\.com/(?:reel|p|tv)/([^/?#]+)') AS code,
           reel_url, insta_account, trim(collection_name) AS collection_name, user_name, added_time
    FROM rawstd.insta_download_saved_reels
),
saves_by_post AS (
    SELECT code,
           array_agg(DISTINCT insta_account) AS accounts,
           coalesce(array_agg(DISTINCT collection_name) FILTER (WHERE collection_name IS NOT NULL), '{}') AS collections,
           min(added_time) AS first_saved_at,
           max(user_name) FILTER (WHERE user_name NOT LIKE 'No user name%') AS user_name,
           bool_or(reel_url LIKE '%/p/%') AS is_photo_url,
           bool_or(reel_url LIKE '%/tv/%') AS is_tv_url
    FROM saves
    GROUP BY code
),
export_details AS (
    SELECT DISTINCT ON (code) code, user_name, caption_text, hashtags
    FROM (
        SELECT substring(reel_url FROM 'instagram\.com/(?:reel|p|tv)/([^/?#]+)') AS code, user_name,
               nullif(trim(caption_text), '') AS caption_text, hashtags, python_runtime
        FROM rawstd.insta_download_saved_reels_details
    ) d
    ORDER BY code, (caption_text IS NULL), python_runtime DESC
),
api AS (
    SELECT r.code, r.product_type, r.taken_at,
           nullif(nullif(trim(r.caption_text), ''), 'None') AS caption_text,
           r.hashtags, r.lat, r.lng, r.location_name, r.city, r.locations_from_caption,
           u.username
    FROM clean.insta_saved_reels r
    LEFT JOIN clean.insta_user u ON u.id = r.user_pk
),
codes AS (
    SELECT code FROM saves_by_post
    UNION
    SELECT code FROM api
)
SELECT
    c.code,
    'https://www.instagram.com/'
        || CASE WHEN s.is_tv_url THEN 'tv'
                WHEN s.is_photo_url OR (a.product_type IS NOT NULL AND a.product_type <> 'clips') THEN 'p' ELSE 'reel' END
        || '/' || c.code || '/' AS url,
    coalesce(s.accounts, '{}') AS accounts,
    coalesce(a.username, d.user_name, s.user_name) AS owner_username,
    coalesce(a.caption_text, d.caption_text) AS caption,
    CASE WHEN a.caption_text IS NOT NULL THEN 'api_2024'
         WHEN d.caption_text IS NOT NULL THEN 'export_2026' END AS caption_source,
    coalesce(nullif(a.hashtags, '{}'), nullif(d.hashtags, '{}'), '{}') AS hashtags,
    coalesce(s.collections, '{}') AS collections,
    ARRAY(SELECT DISTINCT ct.tab FROM clean.collection_tabs ct WHERE ct.collection_name = ANY (s.collections)) AS tabs,
    s.first_saved_at,
    a.taken_at AS posted_at,
    a.lat AS geotag_lat,
    a.lng AS geotag_lng,
    a.location_name AS geotag_name,
    a.city AS geotag_city,
    coalesce(a.locations_from_caption, '{}') AS caption_places
FROM codes c
LEFT JOIN saves_by_post s ON s.code = c.code
LEFT JOIN export_details d ON d.code = c.code
LEFT JOIN api a ON a.code = c.code;

COMMIT;
