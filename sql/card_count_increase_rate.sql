with all_ as (
  select
    card_id
    , count(card_id) as count_all_card_in_trs
  from
    `Elo.concated_transactions`
  group by
    card_id
),

latest3 as (
  select
    card_id
    , count(card_id) as count_latest3_card_in_trs
  from
    `Elo.concated_transactions`
  where
    purchase_date >= "2018-02-01 00:00:00"
  group by
    card_id
),

latest6 as (
  select
    card_id
    , count(card_id) as count_latest6_card_in_trs
  from
    `Elo.concated_transactions`
  where
    purchase_date >= "2017-11-01 00:00:00"
  group by
    card_id
)

select
  a.card_id
  , b.count_latest3_card_in_trs
  , c.count_latest6_card_in_trs

  , b.count_latest3_card_in_trs / a.count_all_card_in_trs as count_increase_rate_from_all_to_latest3
  , c.count_latest6_card_in_trs / a.count_all_card_in_trs as count_increase_rate_from_all_to_latest6
  , b.count_latest3_card_in_trs / c.count_latest6_card_in_trs as count_increase_rate_from_latest6_to_latest3
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
