-- Deploy sqitch_mars:personal-journal-entries to pg

BEGIN;

-- My own writing. Kept in its own schema, apart from the Instagram data, so it can be backed up
-- separately and left out of anything that is ever hosted or shared.
CREATE SCHEMA IF NOT EXISTS personal;

-- One row per reply written in the app's Journal prompts tab.
CREATE TABLE personal.journal_entries (
    id SERIAL PRIMARY KEY,
    prompt_key VARCHAR(32) NOT NULL,    -- clean.journal_prompts.prompt_key (hash of the prompt text)
    prompt_text TEXT NOT NULL,          -- copy of the prompt when the entry was written
    body TEXT NOT NULL,
    written_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP                -- set when the entry is edited
);
CREATE INDEX journal_entries_prompt_idx ON personal.journal_entries (prompt_key);
CREATE INDEX journal_entries_written_idx ON personal.journal_entries (written_at);

COMMIT;
