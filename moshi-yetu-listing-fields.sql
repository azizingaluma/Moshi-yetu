-- ============================================================
-- MOSHI YETU — Extra fields for business_listings
-- (contact_messages table already exists from the full schema)
-- ============================================================

alter table business_listings
  add column if not exists whatsapp text,
  add column if not exists instagram text,
  add column if not exists opening_hours text,
  add column if not exists contact_person text;
