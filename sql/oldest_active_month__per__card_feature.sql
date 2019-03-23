select
  feature
  , min(first_active_month) as feature_oldest_active_month
from (
    select
      parse_date("%Y-%m", first_active_month) as first_active_month
      , concat(CAST(feature_1 as string),  CAST(feature_2 as string),  CAST(feature_3 as string)) as feature
    from
      Elo.train
)
group by
  feature
order by
  feature
