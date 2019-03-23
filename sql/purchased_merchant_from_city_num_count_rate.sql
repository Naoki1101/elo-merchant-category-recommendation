select
  card_id
  , sum(case when count_ = 1 then 1 else 0 end) as count_purchased_merchant_from_1_city
  , sum(case when count_ between 2 and 10 then 1 else 0 end) as count_purchased_merchant_from_2_10_city
  , sum(case when count_ >=11 then 1 else 0 end) as count_purchased_merchant_from_11__city

  , sum(case when count_ = 1 then 1 else 0 end) / count(card_id) as rate_purchased_merchant_from_1_city
  , sum(case when count_ between 2 and 10 then 1 else 0 end) / count(card_id) as rate_purchased_merchant_from_2_10_city
  , sum(case when count_ >=11 then 1 else 0 end) / count(card_id) as rate_purchased_merchant_from_11__city
from(
    select
      a.card_id
      , a.merchant_id
      , b.count_
    from
      `Elo.concated_transactions` as a
    left outer join
      `Elo_processed.nunique_city_id__per__merchant_id` as b
    on
      a.merchant_id = b.merchant_id
    where
      b.count_ is not null
)
group by
  card_id
