{{ config(materialized='table') }}


select a.location, substring(date,-4,4) as year, sum(NEW_CASES) as NEW_NO_CASES, sum(NEW_DEATHS) as NEW_NO_DEATHS, (NEW_NO_DEATHS/NEW_NO_CASES) * 100 as DEATH_RATE ,sum(CASE_FATALITY_RATE) as FATALITY_RATE
from locations a inner join "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_MONNIL_ROY" b 
on a.location = b.location group by a.location, substring(date,-4,4)