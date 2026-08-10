-- ============================================================
-- MOSHI YETU — Map support: add coordinates
-- ============================================================

alter table business_listings
  add column if not exists latitude numeric,
  add column if not exists longitude numeric;

alter table events
  add column if not exists latitude numeric,
  add column if not exists longitude numeric,
  add column if not exists venue_name text,
  add column if not exists start_time text,
  add column if not exists end_time text,
  add column if not exists category text,
  add column if not exists whatsapp text,
  add column if not exists website text,
  add column if not exists ticket_url text,
  add column if not exists is_free boolean default true;
