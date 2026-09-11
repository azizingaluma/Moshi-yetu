# Moshi Yetu — Handoff Notes

## Hali ya sasa (imesasishwa)
**Backend HALISI tayari ipo na inatumika** — mradi si "static prototype" tena. Kurasa 17 za HTML, nyingi zikiwa zimeunganishwa moja kwa moja na **Supabase** (`https://nlvekegglbuabbxhdywm.supabase.co`) kupitia `@supabase/supabase-js` client-side, kwa kutumia "publishable" key iliyowekwa wazi kwenye kila faili husika.

| Faili | Kazi | Imeunganishwa na Supabase? |
|---|---|---|
| `index.html` | Home — hero, search, featured destinations, CTA | Ndiyo (destinations za featured) |
| `moshi-yetu-destinations.html` | Orodha ya maeneo, filters | Hapana (data tuli/hardcoded bado) |
| `moshi-yetu-hotels.html` | Hoteli & malazi, filters | Hapana (data tuli) |
| `moshi-yetu-coffee.html` | Coffee experiences, filters | Hapana (data tuli) |
| `moshi-yetu-culture.html` | Utamaduni & vijiji, filters | Hapana (data tuli) |
| `moshi-yetu-restaurants.html` | Migahawa | Ndiyo |
| `moshi-yetu-transport.html` | Usafiri | Ndiyo |
| `moshi-yetu-events.html` | Matukio (yanapakiwa moja kwa moja kutoka DB) | Ndiyo |
| `moshi-yetu-event-detail.html` | Ukurasa wa tukio moja (kwa `?slug=`) | Ndiyo |
| `moshi-yetu-destination-detail.html` | Ukurasa wa eneo moja (kwa `?slug=`) | Ndiyo — **inahitaji rekodi kwenye jedwali la `destinations`** |
| `moshi-yetu-booking.html` | Booking flow (hatua 4, validation) | Hapana bado — form haihifadhi popote |
| `moshi-yetu-list-business.html` | Fomu ya biashara kujisajili (hatua 4) | Ndiyo — inahifadhi kwenye `business_listings` |
| `moshi-yetu-contact.html` | Fomu ya mawasiliano | Ndiyo — inahifadhi kwenye `contact_messages` |
| `moshi-yetu-admin.html` | Dashibodi ya ndani (login + CRUD ya bookings/listings/destinations) | Ndiyo — ina Supabase Auth (`signInWithPassword`). **Haijaunganishwa kwenye nav kuu kwa makusudi** — inafikika tu kupitia kiungo kidogo cha "Staff Login" chini ya footer ya `index.html`, au URL moja kwa moja |
| `moshi-yetu-about.html` | Kuhusu kampuni | Hapana |
| `moshi-yetu-design-system-preview.html` | Style guide ya ndani | Hapana |

Design tokens zote (rangi, spacing, radius, shadows, fonti Fraunces+Inter) ziko kama CSS variables ndani ya kila faili (zimerudufiwa, sio shared stylesheet).

## ⚠️ Muhimu kwa yeyote atakayeendelea na mradi huu
1. **RLS (Row Level Security)** — kwa kuwa Supabase key iko wazi kwenye kila ukurasa (kama ilivyokusudiwa kwa "publishable"/"anon" key), ulinzi WOTE wa data unategemea RLS policies kwenye kila jedwali (`bookings`, `business_listings`, `destinations`, `events`, `contact_messages`). **Hii lazima ithibitishwe kwenye Supabase dashboard** kabla ya kuzindua site hadharani — bila RLS sahihi, mtu yeyote anaweza kusoma/kuandika/kufuta data moja kwa moja kutoka browser console.
2. **Jedwali la `destinations` bado halina rekodi za maeneo yaliyoorodheshwa kwenye `moshi-yetu-destinations.html`** (Machame Route, Marangu Route, Materuni Waterfalls & Coffee Farm, Chagga Live Museum, Lake Chala, Kikuletwa Hot Springs). Kadi hizo sasa zinaelekeza `moshi-yetu-destination-detail.html?slug=...` lakini zitaonyesha "Not Found" mpaka rekodi ziongezwe kwenye database kwa slugs zinazolingana:
   - `machame-route`, `marangu-route`, `materuni-waterfalls-coffee-farm`, `chagga-live-museum`, `lake-chala`, `kikuletwa-hot-springs`
3. `moshi-yetu-booking.html` bado HAIHIFADHI data popote (JS inaonyesha tu uthibitisho) — hii ndiyo fomu pekee kubwa ambayo bado inahitaji kuunganishwa na database.

## Kinachohitajika kufuata (kazi ya Claude Code)

1. **Database** — jedwali kuu tayari zipo (`business_listings`, `destinations`, `events`, `contact_messages`); bado zinahitajika: `bookings` (kwa uhifadhi halisi wa fomu ya booking), `users`
2. **Backend/API** — booking.html pekee bado haihifadhi (list-business na contact tayari zinahifadhi kwenye Supabase)
3. **Uthibitishaji wa maudhui** — mfumo wa timu ya ndani kukagua/kuidhinisha listings mpya (dashibodi ya admin.html tayari ina sehemu hii, ithibitishwe inafanya kazi vizuri na RLS)
4. **Malipo** — kuunganisha Stripe/M-Pesa kwa booking deposits
5. **Picha halisi** — kubadilisha picha za Unsplash placeholder na picha halisi za biashara (baada ya uthibitishaji)
6. **Lugha mbili** — kitufe cha "EN/SW" kipo kwenye UI lakini hakina utendaji bado
7. **Deployment** — kuchagua hosting (Vercel/Netlify kwa frontend, seva/DB kwa backend) na domain

## V2 Roadmap — vipaumbele kwa awamu (kutoka business review)

### ✅ Tayari (frontend, static)
- Brand tagline: "Everything Kilimanjaro. One place."
- Live weather (Open-Meteo API, client-side, hakuna key)
- Search inayofanya kazi (query params → filter kwenye ukurasa husika)
- Namba za kweli badala ya fake stats
- Category tile grid (na "Soon" badge kwa zisizo tayari)
- Newsletter copy, footer ya kampuni

### Phase 1 — MVP inayoingiza pesa (backend ya msingi)
Lengo: watu waweze ku-book na biashara zijisajili KWELI.
1. Database: `users`, `businesses`, `bookings`, `business_listings`
2. API ya kupokea booking form + list-business form (kuhifadhi, sio kuonyesha tu confirmation)
3. Business verification workflow (timu inakagua listing kabla haijaonekana kwa umma) → **Verified badge**
4. Malipo ya awali: M-Pesa + Tigo Pesa + Airtel Money (ndizo zinazotumika zaidi Tanzania), kisha Stripe/Visa kwa watalii wa kimataifa
5. Reviews za kweli (rating + maandishi + tarehe) zilizounganishwa na bookings zilizothibitishwa (kuzuia fake reviews)
6. User accounts za msingi (login, wishlist/save places)

### Phase 2 — Ugunduzi na uaminifu (discovery & trust)
7. Interactive map (Leaflet + OpenStreetMap ni bure; Google Maps ina gharama) ikionyesha hotels/coffee/waterfalls
8. Business dashboard (biashara ione bookings, ibadilishe bei, ipakie picha, ione reviews)
9. Search iongezwe categories zaidi: Restaurant, Hospital, ATM, Police, Pharmacy — hizi zinahitaji data ya biashara halisi kwanza (huwezi kuorodhesha hospitali bila ruhusa/uthibitisho)
10. Currency converter (free API kama exchangerate.host)
11. Lugha: Kiswahili kwanza (soko lako la ndani), kisha Kiingereza kikamilifu, halafu Kijerumani/Kifaransa/Kichina baadaye kadri wateja wa kimataifa wanavyoongezeka

### Phase 3 — Ushiriki na ukuaji (engagement & growth = SEO/revenue)
12. Blog (hii ndiyo injini ya SEO — travel, food, coffee, history, culture, adventure)
13. Events calendar (Leo/Kesho/Wiki hii/Mwezi huu, sio orodha tu)
14. Jobs board (hotels/coffee farms/safari companies wanaweka nafasi za kazi — chanzo kingine cha mapato kwa matangazo)
15. Emergency info (Polisi, Hospitali, Zimamoto, Ubalozi, Taxi, Uwanja wa ndege) — muhimu sana kwa usalama wa mtalii
16. Local deals/discounts (weekend offers, low-season discounts)
17. Business analytics (visitors, clicks, bookings, revenue kwa kila biashara)

### Phase 4 — Baadaye (nice-to-have, sio muhimu kwa mapato ya awali)
18. AI Trip Planner (siku, bajeti, maslahi → itinerary) — inahitaji AI API + logic ya bei halisi
19. Gallery ya video/drone/360°
20. Community posts (wenyeji wanaweka picha/mapendekezo)
21. Mobile app (Android/iOS, offline maps)
22. Dark mode
23. Push notifications (event, hali ya hewa, discount, booking)

### Kanuni za kufuata (kutoka kwenye review yako, bado zinatumika)
- ❌ Usiweke fake statistics — kama huna data ya kweli, andika "Coming Soon"
- ❌ Usiweke placeholder content ya kudumu — vitu vya "Soon" viwe wazi vinasema hivyo
- ❌ Usiweke vitufe visivyofanya kazi — kila kiungo lazima kiende mahali halisi au kisionekane kabisa
- ❌ Usiweke fake reviews — reviews zote zitoke kwa bookings zilizothibitishwa

## Vidokezo kwa Claude Code
- Faili zote zina relative links kati yao (`href="moshi-yetu-booking.html"`) — zinafanya kazi zikiwa folda moja
- JS zote ni vanilla (hakuna framework) — inaweza kubaki hivyo au kuhamishiwa React/Next.js wakati wa kuongeza backend
- CSS custom properties (`:root { --kilimanjaro-500... }`) ndizo chanzo cha ukweli cha design system — zitumike wakati wa kuongeza kurasa mpya
- Search kwenye Home inatumia `?filter=X` query param — destinations/hotels/coffee/culture pages tayari zinasoma param hiyo kwenye load na kuchuja moja kwa moja

