-- Revert sqitch_mars:clean-journal-prompts from pg

BEGIN;

DROP TABLE clean.journal_prompt_choices;
DROP TABLE clean.journal_prompts;

COMMIT;
