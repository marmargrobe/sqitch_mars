-- Verify sqitch_mars:clean-saved-posts-view on pg

BEGIN;

SELECT code, url, owner_username, caption, caption_source, hashtags, collections, tabs,
       first_saved_at, geotag_lat, geotag_lng, caption_places
FROM clean.saved_posts WHERE FALSE;

ROLLBACK;
