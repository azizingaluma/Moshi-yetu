-- Moshi Yetu — verified destination seed set
-- Sources checked: TANAPA Kilimanjaro National Park pages/publications;
-- mapped coordinates from public geographic/OpenStreetMap-derived sources.
-- Re-check prices, opening times and local access rules before publishing any commercial claim.

INSERT INTO public.destinations
(name, slug, category, district, short_description, full_description, history,
 latitude, longitude, google_maps_url, entry_fee, best_time, opening_hours,
 difficulty, featured, status, source_url, updated_at)
VALUES
(
 'Mount Kilimanjaro National Park', 'mount-kilimanjaro-national-park', 'trekking',
 'Moshi District',
 'Tanzania''s iconic mountain park, home to Africa''s highest peak and several trekking routes.',
 'Kilimanjaro National Park protects Mount Kilimanjaro, including Kibo, Mawenzi and Shira. Visitors come for guided mountain climbing, nature walks, mountain cycling and other permitted park activities. Trekking routes, conservation fees and accommodation charges vary by visitor type and itinerary, so travelers should confirm the current TANAPA schedule before booking.',
 'Kilimanjaro National Park was gazetted in 1973, opened for tourism in 1977 and was declared a UNESCO World Heritage Site in 1987.',
 -3.0674, 37.3556,
 'https://maps.google.com/?q=Kilimanjaro+National+Park',
 'Fees vary by visitor category, route and number of days; confirm current TANAPA schedule.',
 'Year-round; dry periods are generally preferred for climbing.',
 'Gates generally close at 18:00; access is controlled by TANAPA.',
 'Challenging', true, 'published',
 'https://www.tanzaniaparks.go.tz/kilimanjaro', now()
),
(
 'Machame Route', 'machame-route', 'trekking',
 'Hai District',
 'A scenic Kilimanjaro ascent route entering through Machame Gate and crossing rainforest, moorland and high alpine terrain.',
 'Machame is one of the established ascending routes to Mount Kilimanjaro. The route is known for varied scenery and is used by climbers who want a longer acclimatization profile than the minimum itineraries. All summit climbs must be undertaken with a licensed operator under park regulations.',
 'The route is part of Kilimanjaro National Park''s established network of ascending and descending trails managed by TANAPA.',
 -3.17373, 37.23886,
 'https://maps.google.com/?q=Machame+Gate+Tanzania',
 'Route, conservation, camping and rescue fees vary; confirm current TANAPA rates.',
 'June–October and January–February are commonly preferred for trekking.',
 'Park gate access is controlled by TANAPA; confirm daily operating details before travel.',
 'Challenging', true, 'published',
 'https://www.tanzaniaparks.go.tz/kilimanjaro/visitor-guide', now()
),
(
 'Marangu Route', 'marangu-route', 'trekking',
 'Moshi District',
 'The Marangu approach uses mountain huts and is one of the main access routes to Kilimanjaro.',
 'Marangu is one of the six routes identified by TANAPA for ascending Kilimanjaro. Unlike the other main routes, the Marangu route uses designated alpine huts rather than tented camps along the standard trail. Climbers should allow sufficient acclimatization time and use a licensed guide/operator.',
 'Marangu is one of the long-established access routes to Kilimanjaro and remains an important gateway to the mountain.',
 -3.24365, 37.51766,
 'https://maps.google.com/?q=Marangu+Gate+Tanzania',
 'Route, conservation, hut and rescue fees vary; confirm current TANAPA rates.',
 'June–October and January–February are commonly preferred for trekking.',
 'Park gate access is controlled by TANAPA; confirm daily operating details before travel.',
 'Moderate to challenging', true, 'published',
 'https://www.tanzaniaparks.go.tz/kilimanjaro/visitor-guide', now()
),
(
 'Materuni Waterfalls', 'materuni-waterfalls', 'nature',
 'Moshi District',
 'A popular day-trip destination near Moshi combining a waterfall hike, green farmland and Chagga cultural experiences.',
 'Materuni Waterfalls is reached through Materuni Village on the slopes of Mount Kilimanjaro. A typical visit can combine a guided walk through farmland with a waterfall stop and, depending on the operator or community programme, a traditional Chagga coffee experience and local food. Trail conditions and access arrangements can vary, so visitors should confirm local guidance before departure.',
 'Materuni lies within the Chagga cultural landscape around Kilimanjaro, where coffee and banana farming have long been important parts of local livelihoods.',
 -3.25045, 37.40016,
 'https://maps.google.com/?q=Materuni+Waterfalls+Tanzania',
 'Community/guide and tour charges vary by programme; confirm the current local fee.',
 'June–October and December–February are commonly favorable periods for day trips.',
 'Local access hours vary by community/operator; confirm before visiting.',
 'Moderate', true, 'published',
 'https://www.tanzaniatourism.com/destination/materuni-waterfalls', now()
),
(
 'Lake Chala', 'lake-chala', 'nature',
 'Mwanga District',
 'A deep volcanic crater lake on the Tanzania–Kenya border, offering dramatic scenery and a quieter nature experience.',
 'Lake Chala occupies a volcanic crater basin on the south-eastern side of Mount Kilimanjaro and lies across the Tanzania–Kenya border. The lake is known for steep crater walls, forested surroundings and clear views from the rim. Activities and access conditions should be confirmed with the relevant local operator or site management before travel.',
 'Scientific studies describe Lake Chala as a long-lived volcanic crater lake formed in the Kilimanjaro volcanic landscape.',
 -3.316667, 37.683333,
 'https://maps.google.com/?q=Lake+Chala+Tanzania',
 'Local site/operator charges vary.',
 'June–October is commonly preferred for clearer hiking conditions.',
 'Local access hours vary; confirm before travel.',
 'Moderate', false, 'published',
 'https://geographic.org/geographic_names/name.php?c=tanzania&fid=6424&uni=-3527473', now()
),
(
 'Kikuletwa Hot Springs', 'kikuletwa-hot-springs', 'nature',
 'Hai District',
 'A natural geothermal spring near Kikuletwa, also known locally as Maji Moto or Chemka Hot Springs.',
 'Kikuletwa Hot Springs is a geothermal natural attraction in Hai District. The site is known for warm, clear water surrounded by vegetation and is commonly visited as a day trip from Moshi. Travelers should confirm local access arrangements and environmental rules with the site or tour provider before visiting.',
 'The spring is locally associated with names including Maji Moto and Chemka and sits within the wider Kilimanjaro foothills landscape.',
 -3.44397, 37.19378,
 'https://maps.google.com/?q=Kikuletwa+Hot+Springs+Tanzania',
 'Local operator/site charges vary.',
 'Year-round; check local weather and road conditions.',
 'Local access hours vary; confirm before travel.',
 'Easy', false, 'published',
 'https://mapcarta.com/N989045204', now()
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  district = EXCLUDED.district,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  history = EXCLUDED.history,
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  google_maps_url = EXCLUDED.google_maps_url,
  entry_fee = EXCLUDED.entry_fee,
  best_time = EXCLUDED.best_time,
  opening_hours = EXCLUDED.opening_hours,
  difficulty = EXCLUDED.difficulty,
  featured = EXCLUDED.featured,
  status = EXCLUDED.status,
  source_url = EXCLUDED.source_url,
  updated_at = now();
