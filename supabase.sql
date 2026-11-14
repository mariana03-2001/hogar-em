-- Hogar E&M · base de datos
-- Supabase → SQL Editor → New query → pega todo esto → Run

create table if not exists public.items (
  col        text        not null,          -- tareas | aseo | compras | precios | hogar
  id         text        not null,
  data       jsonb       not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (col, id)
);

alter table public.items enable row level security;

-- Solo las cuentas que ustedes creen en Supabase (usuarios con sesión) pueden leer y escribir.
drop policy if exists "hogar leer"      on public.items;
drop policy if exists "hogar crear"     on public.items;
drop policy if exists "hogar editar"    on public.items;
drop policy if exists "hogar borrar"    on public.items;
create policy "hogar leer"   on public.items for select to authenticated using (true);
create policy "hogar crear"  on public.items for insert to authenticated with check (true);
create policy "hogar editar" on public.items for update to authenticated using (true) with check (true);
create policy "hogar borrar" on public.items for delete to authenticated using (true);

-- Cambios en vivo entre los dos celulares
alter table public.items replica identity full;
do $$ begin
  alter publication supabase_realtime add table public.items;
exception when duplicate_object then null; end $$;
