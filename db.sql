drop database if exists videogames;

create database videogames;

\c videogames

CREATE TABLE "genres" (
  "id" INT,
  "name" varchar,
  PRIMARY KEY ("id")
);

CREATE TABLE "users" (
  "id" serial,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "salt" varchar,
  PRIMARY KEY ("id")
);

CREATE TABLE "consoles" (
  "id" serial,
  "name" varchar,
  PRIMARY KEY ("id")
);

CREATE TABLE "user_console" (
  "id" serial,
  "user_id" INT,
  "console_id" INT,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_user_console.id"
    FOREIGN KEY ("id")
      REFERENCES "users"("email"),
  CONSTRAINT "FK_user_console.id"
    FOREIGN KEY ("id")
      REFERENCES "consoles"("name")
);

CREATE INDEX "CCK" ON  "user_console" ("user_id", "console_id");

CREATE TABLE "games" (
  "id" serial,
  "title" varchar,
  "genre_id" INT,
  "release_date" INT,
  "developer" varchar,
  "rating" INT,
  "console_id" INT,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_games.title"
    FOREIGN KEY ("title")
      REFERENCES "genres"("id"),
  CONSTRAINT "FK_games.title"
    FOREIGN KEY ("title")
      REFERENCES "consoles"("id")
);

CREATE INDEX "CCK" ON  "games" ("genre_id", "console_id");
