{{
    config(
    materialized = 'table'
    )
 }}



with first_replace as(
	select 
		dg.surrogate_key_genres,
		replace(replace(dg.genres,']',''),'[','') as genre
	from {{ ref('d_genres') }} dg 
),
second_replace as 
(
	select 
		surrogate_key_genres,
		replace(genre,'''', '') as genre
	from first_replace

)
select 
	surrogate_key_genres,
	genre
from second_replace
where genre not ilike '% %'




