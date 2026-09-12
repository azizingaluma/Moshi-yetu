# Moshi Yetu Admin Fix — Business Listings

## What changed
- Removed all Admin Manage Content calls to the old `public.listings` table.
- Manage Content now reads/writes `public.business_listings`.
- Added fields matching the existing business listing schema: name, category, description, address, region, phone, email, website, WhatsApp, Instagram, opening hours, contact person, latitude, longitude, status.
- Added cover-image upload support through the existing `listing-images` Storage bucket.
- Added optional `image_url` and `featured` fields to `business_listings` via the included SQL migration.
- Existing Destinations, Bookings, and Business Listings tabs remain intact.

## Important
Run `moshi-yetu-business-listings-media.sql` once in Supabase SQL Editor before using the cover image / featured fields.

Do NOT create a `public.listings` table.
