-- Revert sqitch_mars:clean-collection-tabs from pg

BEGIN;

DROP TABLE clean.collection_tabs;

COMMIT;
