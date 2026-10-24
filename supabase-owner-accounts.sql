-- Clickrfun Puppy / Owner account types
-- Run this once in Supabase Dashboard > SQL Editor before using the new role fields.
alter table public.profiles
  add column if not exists account_type text not null default 'puppy',
  add column if not exists owned_puppies text not null default '';

alter table public.profiles
  drop constraint if exists profiles_account_type_check;

alter table public.profiles
  add constraint profiles_account_type_check
  check (account_type in ('puppy', 'owner'));
