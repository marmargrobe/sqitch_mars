-- Deploy sqitch_mars:clean-journal-prompts to pg
-- requires: clean-saved-posts-view

BEGIN;

-- One row per prompt found in a Journals post. Rebuilt by src/data_cleaner/journal_prompts_extract.py.
CREATE TABLE clean.journal_prompts (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) NOT NULL,          -- clean.saved_posts.code
    position SMALLINT NOT NULL,         -- order within the post
    prompt TEXT NOT NULL,
    prompt_key VARCHAR(32) NOT NULL,    -- md5 of the normalized prompt; links to journal_prompt_choices
    kind VARCHAR(10) NOT NULL,          -- question | chatgpt
    heading VARCHAR,                    -- e.g. 'Socratic Dialogue' for a ChatGPT prompt
    category VARCHAR(30),               -- automatic first guess
    extractor_version VARCHAR(10),
    extracted_at TIMESTAMP,
    UNIQUE (code, position)
);
CREATE INDEX journal_prompts_key_idx ON clean.journal_prompts (prompt_key);

-- My labels. Keyed by prompt text, so they survive re-extraction.
CREATE TABLE clean.journal_prompt_choices (
    prompt_key VARCHAR(32) PRIMARY KEY,
    category VARCHAR(30),               -- my category; wins over the automatic one
    favorite BOOLEAN NOT NULL DEFAULT FALSE,
    used BOOLEAN NOT NULL DEFAULT FALSE,     -- already journaled about it
    hidden BOOLEAN NOT NULL DEFAULT FALSE,
    updated_at TIMESTAMP NOT NULL DEFAULT now()
);

COMMIT;
