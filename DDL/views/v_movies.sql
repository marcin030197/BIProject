create view dwh.v_movies as (
	select 
		fm.title,
		fm.relase_year_date,
		fm.imdb_score,
		fm.imdb_votes,
		dg.genre 
	from dwh.f_movies fm
	left join dwh.d_genres dg on dg.id=fm.id_genre 
	where fm.imdb_score is not null
)