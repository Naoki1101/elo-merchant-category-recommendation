select
  card_id

  , sum(case when category_2 is null then 1 else 0 end) as count_null_category_2
  , sum(case when category_2 is null then 1 else 0 end) / count(card_id) as rate_null_category_2

  , sum(case when category_3 is null then 1 else 0 end) as count_null_category_3
  , sum(case when category_3 is null then 1 else 0 end) / count(card_id) as rate_null_category_3

  , sum(case when merchant_id is null then 1 else 0 end) as count_null_merchant_id
  , sum(case when merchant_id is null then 1 else 0 end) / count(card_id) as rate_null_merchant_id
from
  `Elo.historical_transactions`
group by
  card_id
