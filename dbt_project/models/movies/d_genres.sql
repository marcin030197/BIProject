{{
    config(
    materialized = 'table'
    )
 }}


with distinct_genres as 
(
select 
 {{ dbt_utils.generate_surrogate_key(['dg.genres']) }} as surrogate_key_genres,
	dg.genres
from 
	(
		select 	
			distinct (genres) as genres
		from {{ source('public', 'imdb_movies_shows') }}
	) dg

)
select * from distinct_genres