-- Run this once in Supabase: SQL Editor > New query.
create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text not null check (char_length(full_name) between 2 and 80),
  programme text not null check (char_length(programme) between 2 and 120),
  category text not null check (category in ('Technology','Design','Creative','Academics')),
  offers text[] not null default '{}',
  wants text[] not null default '{}',
  bio text not null check (char_length(bio) between 10 and 500),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.swap_requests (
  id uuid primary key default gen_random_uuid(),
  sender_id uuid not null references public.profiles(id) on delete cascade,
  recipient_id uuid not null references public.profiles(id) on delete cascade,
  message text not null check (char_length(message) between 3 and 1000),
  status text not null default 'pending' check (status in ('pending','accepted','declined')),
  created_at timestamptz not null default now(),
  constraint different_students check (sender_id <> recipient_id)
);

alter table public.profiles enable row level security;
alter table public.swap_requests enable row level security;

-- Public profiles are deliberately readable so students can discover each other.
create policy "Profiles are readable" on public.profiles for select using (true);
create policy "Students create own profile" on public.profiles for insert to authenticated with check (auth.uid() = id);
create policy "Students update own profile" on public.profiles for update to authenticated using (auth.uid() = id) with check (auth.uid() = id);
create policy "Students delete own profile" on public.profiles for delete to authenticated using (auth.uid() = id);

create policy "Students see their requests" on public.swap_requests for select to authenticated using (auth.uid() = sender_id or auth.uid() = recipient_id);
create policy "Students send requests" on public.swap_requests for insert to authenticated with check (auth.uid() = sender_id and auth.uid() <> recipient_id);
create policy "Recipients update request status" on public.swap_requests for update to authenticated using (auth.uid() = recipient_id) with check (auth.uid() = recipient_id);
create policy "Participants delete requests" on public.swap_requests for delete to authenticated using (auth.uid() = sender_id or auth.uid() = recipient_id);

create index swap_requests_sender_idx on public.swap_requests(sender_id);
create index swap_requests_recipient_idx on public.swap_requests(recipient_id);
