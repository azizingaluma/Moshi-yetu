-- Moshi Yetu production data foundation
-- Run in Supabase SQL Editor after reviewing with the existing schema.

ALTER TABLE public.destinations
  ADD COLUMN IF NOT EXISTS category text;

ALTER TABLE public.destinations
  ADD COLUMN IF NOT EXISTS source_url text;

CREATE INDEX IF NOT EXISTS destinations_status_category_idx
  ON public.destinations(status, category);

CREATE UNIQUE INDEX IF NOT EXISTS destinations_slug_unique_idx
  ON public.destinations(slug);

-- Recommended value set for the current frontend filters.
-- Existing rows are not modified automatically.
