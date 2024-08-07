CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "login" varchar,
  "email" varchar,
  "password" varchar,
  "created_at" timestamp
);

CREATE TABLE "posts" (
  "id" integer PRIMARY KEY,
  "title" text,
  "description" text,
  "user_id" integer,
  "status" varchar,
  "latitude" PostGIS,
  "longitude" PostGIS,
  "created_at" timestamp,
  "tags" jsonb,
  "photos" jsonb,
);

CREATE TABLE "comments" (
  "user_id" integer,
  "post_id" integer,
  "text" varchar,
  "created_at" timestamp
);

CREATE TABLE "likes" (
  "user_id" integer,
  "post_id" integer,
  "created_at" timestamp
);

CREATE TABLE "chats" (
  "id" integer PRIMARY KEY
);

CREATE TABLE "messages" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "chat_id" integer,
  "message" varchar,
  "created_at" timestamp
);

CREATE TABLE "follow_links" (
  "following_user_id" integer,
  "followed_by_user_id" integer,
  "created_at" timestamp
);

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "messages" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "messages" ADD FOREIGN KEY ("chat_id") REFERENCES "chats" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "follow_links" ADD FOREIGN KEY ("following_user_id") REFERENCES "users" ("id");

ALTER TABLE "follow_links" ADD FOREIGN KEY ("followed_by_user_id") REFERENCES "users" ("id");
