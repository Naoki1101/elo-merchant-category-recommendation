select
  merchant_id
  , count(city_id) as count_
from (
  select distinct
    merchant_id
    , city_id
  from
    `Elo.concated_transactions`
  where
    merchant_id is not null
)
group by
  merchant_id
order by
  2 desc;
