with all_ as (
  select
    card_id
    , date_diff(date(max(purchase_date)), date(min(purchase_date)), day) / count(card_id) as frequency_all
  from
    `Elo.concated_transactions`
  group by
    card_id
),

latest3 as (
  select
    card_id
    , case when count(card_id) > 0
      then date_diff(date(max(purchase_date)), date(min(purchase_date)), day) / count(card_id)
      else 90 end as frequency_latest3
  from (
    select
      card_id
      , purchase_date
    from
      `Elo.concated_transactions`
    where
      purchase_date >= "2018-02-01 00:00:00"
  )
  group by
    card_id
),

latest6 as (
  select
    card_id
    , case when count(card_id) > 0
      then date_diff(date(max(purchase_date)), date(min(purchase_date)), day) / count(card_id)
      else 180 end as frequency_latest6
  from (
    select
      card_id
      , purchase_date
    from
      `Elo.concated_transactions`
    where
      purchase_date >= "2017-11-01 00:00:00"
  )
  group by
    card_id
)

select
  a.card_id
  , a.frequency_all
  , b.frequency_latest3
  , c.frequency_latest6

  , case when a.frequency_all > 0
    then b.frequency_latest3 / a.frequency_all
    else 0 end as frequency_increase_rate_from_all_to_latest3
  , case when a.frequency_all > 0
    then c.frequency_latest6 / a.frequency_all
    else 0 end as frequency_increase_rate_from_all_to_latest6
  , case when c.frequency_latest6 > 0
    then b.frequency_latest3 / c.frequency_latest6
    else 0 end as frequency_increase_rate_from_latest6_to_latest3
from
  all_ as a
left outer join
  latest3 as b
on
  a.card_id = b.card_id
left outer join
  latest6 as c
on
  a.card_id = c.card_id
