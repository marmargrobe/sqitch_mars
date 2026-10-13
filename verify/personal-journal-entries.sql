-- Verify sqitch_mars:personal-journal-entries on pg

BEGIN;

SELECT id, prompt_key, prompt_text, body, written_at, updated_at FROM personal.journal_entries WHERE FALSE;

ROLLBACK;
