with
    date_spine as (
        {{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2019-01-01' as date)",
    end_date="cast('2040-12-31' as date)"
   )
}}
    ),

    final as (
        select
            cast(format_date('%Y%m%d', cast(date_day as date)) as int64) as date_key,
            cast(date_day as date) as calendar_date,
            extract(year from cast(date_day as date)) as date_year,
            extract(month from cast(date_day as date)) as date_month,
            extract(day from cast(date_day as date)) as day_of_month,
            concat('Q', extract(quarter from cast(date_day as date))) as quarter_name
        from date_spine
    )

select *
from final
