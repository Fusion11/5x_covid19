{{ config(materialized='table') }}


select a.location, substring(date,-4,4) as year, sum(NEW_CASES) as NEW_NO_CASES,sum(NEW_ACTIVE_CASES) as NEW_NO_ACTIVE_CASES, (NEW_NO_ACTIVE_CASES/NEW_NO_CASES) * 100 as RATE_ACTIVE_CASES,
sum(POPULATION_DENSITY) as NET_POPULATION_DENSITY, sum(GROWTH_FACTOR_OF_NEW_CASES) as GROWTH_CHANCE_OF_NEW_CASES
from locations a inner join "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_MONNIL_ROY" b 
on a.location = b.location group by a.location, substring(date,-4,4)