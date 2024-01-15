{{
    config(
    materialized = 'view'
    )
 }}




with first_replace as (
	select 
		title,
		release_year_date::date,
		replace(replace(genres,']',''),'[','') as genre,
		replace(replace(production_countries ,']',''),'[','') as production_country,
		imdb_score::integer,
		imdb_votes::integer 
	from {{ source('public', 'imdb_movies_shows') }}
	where type='MOVIE'
),
second_replace as (
	select 
		title,
		release_year_date::date,
		replace(genre,'''', '') as genre,
		replace(production_country,'''', '') as production_country,
		imdb_score::integer,
		imdb_votes::integer 
	from first_replace
)
select 
*
from second_replace
where genre not ilike '% %' and genre!=''