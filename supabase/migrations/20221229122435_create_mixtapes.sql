create table "public"."mixtapes" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now(),
    "name" text,
    "year" text,
    "comment" text,
    "tracks_text" text,
    "cover" text
);


alter table "public"."mixtapes" enable row level security;

CREATE UNIQUE INDEX mixtapes_pkey ON public.mixtapes USING btree (id);

alter table "public"."mixtapes" add constraint "mixtapes_pkey" PRIMARY KEY using index "mixtapes_pkey";

create policy "Public mixtapes are viewable by everyone."
on "public"."mixtapes"
as permissive
for select
to public
using (true);

