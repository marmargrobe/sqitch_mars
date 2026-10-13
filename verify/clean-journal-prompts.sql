-- Verify sqitch_mars:clean-journal-prompts on pg

BEGIN;

SELECT id, code, position, prompt, prompt_key, kind, heading, category FROM clean.journal_prompts WHERE FALSE;
SELECT prompt_key, category, favorite, used, hidden FROM clean.journal_prompt_choices WHERE FALSE;

ROLLBACK;
