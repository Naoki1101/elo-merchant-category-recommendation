with h_trs as (
    select
      card_id
      , sum(case when merchant_id is null then 1 else 0 end) as hist_merchant_null_count
    from
      `Elo.historical_transactions`
    group by
      card_id
),

n_trs as (
    select
      card_id
      , sum(case when merchant_id is null then 1 else 0 end) as new_merchant_null_count
    from
      `Elo.new_merchant_transactions`
    group by
      card_id
)

select
  a.card_id
  , hist_merchant_null_count
  , new_merchant_null_count
from
  h_trs as a
left outer join
  n_trs as b
on
  a.card_id = b.card_id
order by
  new_merchant_null_count desc
