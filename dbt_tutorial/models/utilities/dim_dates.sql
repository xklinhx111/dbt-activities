{{
  dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2016-09-01' as date)",
    end_date="current_date()"
  )
}}
