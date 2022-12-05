BEGIN;


CREATE TABLE IF NOT EXISTS public.users
(
    user_name character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    mobile_number character varying(20) NOT NULL,
    email character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    state text NOT NULL,
    PRIMARY KEY (user_name)
);

CREATE TABLE IF NOT EXISTS public.user_card
(
    card_number character varying(20) NOT NULL,
    user_name character varying(20) NOT NULL,
    exp_date date NOT NULL,
    bank text NOT NULL,
    card_type text NOT NULL,
    PRIMARY KEY (card_number)
);

CREATE TABLE IF NOT EXISTS public.songs
(
    song_id serial NOT NULL,
    length double precision NOT NULL,
    song_name character varying(30) NOT NULL,
    movie_album character varying(50) NOT NULL,
    PRIMARY KEY (song_id)
);

CREATE TABLE IF NOT EXISTS public.singer
(
    singer_id serial NOT NULL,
    name text NOT NULL,
    PRIMARY KEY (singer_id)
);

CREATE TABLE IF NOT EXISTS public.songs_singer
(
    song_id serial NOT NULL,
    singer_id serial NOT NULL
);

CREATE TABLE IF NOT EXISTS public.music_director
(
    director_id serial NOT NULL,
    name text NOT NULL,
    PRIMARY KEY (director_id)
);

CREATE TABLE IF NOT EXISTS public.users_songs_played
(
    user_name character varying(20) NOT NULL,
    song_id serial NOT NULL,
    date_of_play date NOT NULL
);

CREATE TABLE IF NOT EXISTS public.playlist
(
    playlist_id serial NOT NULL,
    playlist_name text NOT NULL,
    PRIMARY KEY (playlist_id)
);

CREATE TABLE IF NOT EXISTS public.playlist_users
(
    playlist_id serial NOT NULL,
    user_name character varying(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.playlist_songs
(
    playlist_id serial NOT NULL,
    song_id serial NOT NULL
);

CREATE TABLE IF NOT EXISTS public.payments
(
    paymnet_id serial NOT NULL,
    amount smallint NOT NULL,
    date_of_pay date NOT NULL,
    card_number character varying(20) NOT NULL,
    PRIMARY KEY (paymnet_id)
);

CREATE TABLE IF NOT EXISTS public.music_director_songs
(
    director_id serial NOT NULL,
    song_id serial NOT NULL
);

ALTER TABLE IF EXISTS public.user_card
    ADD CONSTRAINT user_name FOREIGN KEY (user_name)
    REFERENCES public.users (user_name) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.songs_singer
    ADD FOREIGN KEY (song_id)
    REFERENCES public.songs (song_id) MATCH SIMPLE
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
    NOT VALID;


ALTER TABLE IF EXISTS public.songs_singer
    ADD FOREIGN KEY (singer_id)
    REFERENCES public.singer (singer_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Users_songs_played"
    ADD FOREIGN KEY (user_name)
    REFERENCES public.users (user_name) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public."Users_songs_played"
    ADD FOREIGN KEY (song_id)
    REFERENCES public.songs (song_id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public."playlist_Users"
    ADD FOREIGN KEY (playlist_id)
    REFERENCES public.playlist (playlist_id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public."playlist_Users"
    ADD FOREIGN KEY (user_name)
    REFERENCES public.users (user_name) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public.playlist_songs
    ADD FOREIGN KEY (playlist_id)
    REFERENCES public.playlist (playlist_id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public.playlist_songs
    ADD FOREIGN KEY (song_id)
    REFERENCES public.songs (song_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.payments
    ADD FOREIGN KEY (card_number)
    REFERENCES public.user_card (card_number) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.music_director_songs
    ADD FOREIGN KEY (director_id)
    REFERENCES public.music_director (director_id) MATCH SIMPLE
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
    NOT VALID;


ALTER TABLE IF EXISTS public.music_director_songs
    ADD FOREIGN KEY (song_id)
    REFERENCES public.songs (song_id) MATCH SIMPLE
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
    NOT VALID;

END;