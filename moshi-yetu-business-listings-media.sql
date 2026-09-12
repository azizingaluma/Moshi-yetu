-- Moshi Yetu: business listing media/editorial fields
-- Run once in Supabase SQL Editor. This does NOT create a new listings table.

ALTER TABLE public.business_listings
  ADD COLUMN IF NOT EXISTS image_url TEXT,
  ADD COLUMN IF NOT EXISTS featured BOOLEAN NOT NULL DEFAULT FALSE;

CREATE INDEX IF NOT EXISTS business_listings_featured_idx
  ON public.business_listings (featured)
  WHERE featured = TRUE;

NOTIFY pgrst, 'reload schema';
