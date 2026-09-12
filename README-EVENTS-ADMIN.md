# Moshi Yetu — Events Admin

## What was added
- **Events** tab in `moshi-yetu-admin.html`
- Add, edit, publish/unpublish and delete events
- Event slug auto-generation
- Start/end date and time
- Venue, location, organizer and contact details
- WhatsApp, website and ticket/registration URL
- Free/paid ticket setting and ticket price
- Latitude/longitude for the Moshi Yetu map
- Featured event toggle
- Cover image by URL or upload to the `events` Storage bucket

## Supabase setup
1. Open **Supabase → SQL Editor**.
2. Run `moshi-yetu-events-admin.sql`.
3. Confirm the logged-in admin user is authenticated in Supabase Auth.
4. Open the admin dashboard and choose **Events**.

## Important
Only events with `status = 'published'` are public. The existing public Events page reads published rows from `events`, and the map also reads published events with coordinates.
