{{ config(materialized='table') }}

select a.location, sum(TOTAL_CASES) as TOTAL_NO_CASES, sum(TOTAL_ACTIVE_CASES) as TOTAL_NO_ACTIVE_CASES,  sum(TOTAL_RECOVERED) as TOTAL_NO_RECOVERED, sum(TOTAL_DEATHS) as TOTAL_NO_DEATHS,
(TOTAL_NO_RECOVERED/TOTAL_NO_CASES) * 100 as recovery_rate
from locations a inner join "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_MONNIL_ROY" b on a.location = b.location group by a.location