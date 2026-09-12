-- Moshi Yetu: Events Admin + public image storage
-- Run in Supabase SQL Editor before using image uploads or publishing events.

-- The public Events page reads published events; the admin dashboard needs
-- authenticated CRUD access.
ALTER TABLE public.events ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "events_public_read_published" ON public.events;
CREATE POLICY "events_public_read_published"
ON public.events FOR SELECT
TO anon, authenticated
USING (status = 'published');

DROP POLICY IF EXISTS "events_authenticated_select" ON public.events;
CREATE POLICY "events_authenticated_select"
ON public.events FOR SELECT
TO authenticated
USING (true);

DROP POLICY IF EXISTS "events_authenticated_insert" ON public.events;
CREATE POLICY "events_authenticated_insert"
ON public.events FOR INSERT
TO authenticated
WITH CHECK (true);

DROP POLICY IF EXISTS "events_authenticated_update" ON public.events;
CREATE POLICY "events_authenticated_update"
ON public.events FOR UPDATE
TO authenticated
USING (true)
WITH CHECK (true);

DROP POLICY IF EXISTS "events_authenticated_delete" ON public.events;
CREATE POLICY "events_authenticated_delete"
ON public.events FOR DELETE
TO authenticated
USING (true);

-- Public bucket for event cover images.
INSERT INTO storage.buckets (id, name, public)
VALUES ('events', 'events', true)
ON CONFLICT (id) DO UPDATE SET public = true;

DROP POLICY IF EXISTS "events_images_public_read" ON storage.objects;
CREATE POLICY "events_images_public_read"
ON storage.objects FOR SELECT
TO public
USING (bucket_id = 'events');

DROP POLICY IF EXISTS "events_images_authenticated_insert" ON storage.objects;
CREATE POLICY "events_images_authenticated_insert"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (bucket_id = 'events');

DROP POLICY IF EXISTS "events_images_authenticated_update" ON storage.objects;
CREATE POLICY "events_images_authenticated_update"
ON storage.objects FOR UPDATE
TO authenticated
USING (bucket_id = 'events')
WITH CHECK (bucket_id = 'events');

DROP POLICY IF EXISTS "events_images_authenticated_delete" ON storage.objects;
CREATE POLICY "events_images_authenticated_delete"
ON storage.objects FOR DELETE
TO authenticated
USING (bucket_id = 'events');

NOTIFY pgrst, 'reload schema';
