{{
    config(
    materialized = 'table'
    )
 }}



select 
	fm.title,
	fm.release_year_date,
	fm.imdb_score,
	fm.imdb_votes,
	dg.id as id_genre
from {{ ref('stg_movies') }} fm 
inner join dwh.{{ ref('d_genres') }}  dg on dg.genre=fm.genre 