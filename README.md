# Moshi Yetu — Production Fix Pack

## What was fixed
- Canonicalized the current frontend files to one clean filename per page.
- Fixed the booking flow so it saves booking requests to `public.bookings` and validates future dates.
- Made homepage statistics database-backed instead of hard-coded.
- Removed misleading static event content and kept the published Supabase event feed as the source of truth.
- Made the Destinations page database-first and added a `category` field to support its filters.
- Added database-backed "Verified" sections to Hotels, Coffee and Culture pages.
- Restored/administered destination category editing in the staff dashboard.
- Preserved the existing Vanilla HTML/CSS/JS + Supabase architecture; no risky framework migration.

## Database files
1. `moshi-yetu-data-migration.sql` — add destination categorization/source fields and supporting indexes.
2. `moshi-yetu-seed-destinations.sql` — initial real destination dataset based on official/credible public sources.

Run the migration before the seed. Review the seed and current Supabase RLS policies before publishing.

## Important
The public Supabase key is intentionally client-side. Security must come from strict RLS policies. This pack does not silently change your database policies because the exact current policies are not visible in the frontend source files.

The booking page saves a request; it does **not** take payment. Payment integration should be added only after the request/confirmation flow is stable.
