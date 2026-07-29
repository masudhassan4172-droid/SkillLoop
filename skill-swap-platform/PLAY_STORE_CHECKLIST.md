# SkillLoop launch checklist

## 1. Launch the website and Chrome app

- [ ] Create the Supabase project; run `supabase/schema.sql`.
- [ ] Put the Supabase project URL and anon public key in `config.js`.
- [ ] Deploy this folder to Vercel with its own HTTPS domain, such as `skillloop.app`.
- [ ] In Supabase Authentication, set that domain as the Site URL and add it to Redirect URLs.
- [ ] Test with two student accounts: profile creation, search, request, accept, decline, removal, sign out/in, and account deletion.
- [ ] Publish `privacy.html` and add its URL to your website footer and Play Console listing.
- [ ] Open the live site in Chrome on Android and choose **Install app**. The included manifest and service worker make it installable as a PWA.

## 2. Prepare the Android app bundle for Play Store

Use [PWABuilder](https://www.pwabuilder.com/) after the site is live. Enter the deployed SkillLoop address and choose the Android package. It will create a Trusted Web Activity (TWA) Android project or app bundle that opens the PWA as a native Android app.

- [ ] Use package name `com.skillloop.app` (or your own permanent reverse-domain name).
- [ ] Generate and safely back up a release signing key. Never lose it.
- [ ] Get the SHA-256 fingerprint from the release signing key.
- [ ] Replace the placeholder in `.well-known/assetlinks.json.template`, rename it to `assetlinks.json`, and deploy it at `https://YOUR_DOMAIN/.well-known/assetlinks.json`.
- [ ] Build the signed `.aab` supplied by PWABuilder or Android Studio.
- [ ] Install and test the app on physical Android devices before uploading.

## 3. Google Play Console submission

- [ ] Create and verify a Google Play developer account.
- [ ] Create the app in Play Console: name **SkillLoop**, category **Education**, app, free.
- [ ] Upload the signed Android App Bundle (`.aab`) and enable Play App Signing.
- [ ] Complete store listing: 512×512 icon, feature graphic, minimum two phone screenshots, description, support email, and privacy-policy URL.
- [ ] Complete App content: Data safety, content rating, target audience, ads declaration, and reviewer test-account instructions.
- [ ] Provide a working demo account to Play reviewers if sign-in is required.
- [ ] Run an internal test first. New personal developer accounts need a closed test with at least 12 opted-in testers for 14 continuous days before production access.
- [ ] Submit for review, then roll out to production after approval.

## 4. Before sharing with students

- [ ] Add moderation/reporting and block-user flows.
- [ ] Restrict registration to the appropriate institutional email domain if this is campus-only.
- [ ] Set up backups, monitoring, and a support email.
- [ ] Have an authorized campus representative review branding and privacy practice.
