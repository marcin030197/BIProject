CREATE TABLE dwh.d_genres (
	id serial4 NOT NULL,
	surrogate_key_genres text NULL,
	genre varchar(100) NULL,
	CONSTRAINT d_genres_pkey PRIMARY KEY (id)
);
