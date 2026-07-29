# SkillLoop — public multi-student website

SkillLoop is a serverless student skill-swap platform. Students can make an account, create a public profile, discover other students, send swap requests, and accept or decline requests. Profiles and requests are shared securely through Supabase.

## Publish it

1. Create a free [Supabase](https://supabase.com) project.
2. In **SQL Editor**, run the full contents of `supabase/schema.sql`.
3. In **Authentication → Providers**, enable Email. For initial testing, turn off **Confirm email**; turn it back on before public launch and set your production site URL under **Authentication → URL Configuration**.
4. Copy the project URL and **anon public** key from **Project Settings → API** into `config.js`. Never use the Supabase `service_role` key in this app.
5. Upload this entire folder to a GitHub repository, then import that repository into [Vercel](https://vercel.com). No build command is needed; this is a static site.
6. In Supabase Authentication URL Configuration, add your Vercel address to **Site URL** and **Redirect URLs**.
7. For the in-app account deletion control, install the Supabase CLI, log in, link the project, and run `supabase functions deploy delete-account`. The function uses Supabase-managed secrets; do not add a service-role key to `config.js`.

## Local test

After adding your Supabase settings, open `index.html` in a browser. Make two accounts using different email addresses to test the complete request flow.

## Production notes

- The security rules in `supabase/schema.sql` ensure students can edit only their own profiles and can view or manage only their own swap requests.
- Profiles are intentionally public to logged-out visitors for discovery. Restrict the profile read policy if the community should require login.
- Before launch, add a privacy policy, campus reporting/moderation workflow, and a student-email domain restriction if applicable.
- The project includes PWA files so the deployed site can be installed from Chrome on Android. See `PLAY_STORE_CHECKLIST.md` for the Play Store release path.
