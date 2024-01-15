CREATE TABLE dwh.f_movies (
	id serial4 NOT NULL,
	title text NULL,
	relase_year_date date NULL,
	imdb_score int4 NULL,
	imdb_votes int4 NULL,
	id_genre int4 NULL,
	CONSTRAINT f_movies_pkey PRIMARY KEY (id)
);
