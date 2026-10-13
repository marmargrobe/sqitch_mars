-- Deploy sqitch_mars:clean-collection-tabs to pg

BEGIN;

-- Which app tab each Instagram collection feeds. Collections not listed are not shown in a tab.
CREATE TABLE clean.collection_tabs (
    collection_name VARCHAR(50) PRIMARY KEY,
    tab VARCHAR(30) NOT NULL
);

INSERT INTO clean.collection_tabs (collection_name, tab) VALUES
    ('Travel', 'travel'), ('Mars & Ags', 'travel'), ('Travel Ags and Mars', 'travel'),
    ('Sf places', 'travel'), ('Norway Trip', 'travel'), ('New Travel', 'travel'),
    ('California', 'travel'), ('Japan', 'travel'), ('Korea', 'travel'), ('Taipei', 'travel'),
    ('Poland', 'travel'), ('Eurotrip 2025', 'travel'), ('Pieniny', 'travel'),
    ('Recipes', 'recipes'),
    ('Movies', 'watch_read'), ('Watch later', 'watch_read'), ('Books', 'watch_read'),
    ('Workouts', 'workouts'), ('Massages', 'workouts'), ('Face yoga', 'workouts'),
    ('Journals', 'journals'),
    ('Projects', 'hobbies'), ('Ideas', 'hobbies'), ('Guitar', 'hobbies'), ('Art', 'hobbies'),
    ('Photography', 'hobbies'), ('Dance', 'hobbies'), ('Clothes', 'hobbies'),
    ('Interior design', 'hobbies'), ('Tattoos', 'hobbies'), ('Make up', 'hobbies'),
    ('Templates', 'hobbies'), ('Wedding inspo', 'hobbies'),
    ('Bithnes', 'business');

COMMIT;
