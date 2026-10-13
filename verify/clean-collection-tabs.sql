-- Verify sqitch_mars:clean-collection-tabs on pg

BEGIN;

SELECT collection_name, tab FROM clean.collection_tabs WHERE FALSE;

ROLLBACK;
