with all_ as (
    select
      card_id
      , avg(purchase_amount) as mean_all_purchase_amount
      , max(purchase_amount) as max_all_purchase_amount
    from(
        select
          card_id
          , 1 /(1 + exp(-1*purchase_amount)) as purchase_amount
        from
          `Elo.concated_transactions`
    )
    group by
      card_id
),

latest3 as (
    select
      card_id
      , avg(purchase_amount) as mean_latest3_purchase_amount
      , max(purchase_amount) as max_latest3_purchase_amount
    from(
        select
          card_id
          , 1 /(1 + exp(-1*purchase_amount)) as purchase_amount
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
      , avg(purchase_amount) as mean_latest6_purchase_amount
      , max(purchase_amount) as max_latest6_purchase_amount
    from(
        select
          card_id
          , 1 /(1 + exp(-1*purchase_amount)) as purchase_amount
        from
          `Elo.concated_transactions`
        where
          purchase_date >= "2018-02-01 00:00:00"
    )
    group by
      card_id
)


select
  a.card_id
  , a.mean_all_purchase_amount
  , a.max_all_purchase_amount
  , b.mean_latest3_purchase_amount
  , b.max_latest3_purchase_amount
  , c.mean_latest6_purchase_amount
  , c.max_latest6_purchase_amount

  , mean_latest3_purchase_amount / mean_all_purchase_amount as mean_increase_rate_from_all_to_latest3
  , mean_latest3_purchase_amount / mean_latest6_purchase_amount as mean_increase_rate_from_latest6_to_latest3
  , mean_latest6_purchase_amount / mean_all_purchase_amount as meas_increase_rate_from_all_to_latest6

  , max_latest3_purchase_amount / max_all_purchase_amount as max_increase_rate_from_all_to_latest3
  , max_latest3_purchase_amount / max_latest6_purchase_amount as max_increase_rate_from_latest6_to_latest3
  , max_latest6_purchase_amount / max_all_purchase_amount as max_increase_rate_from_all_to_latest6
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
