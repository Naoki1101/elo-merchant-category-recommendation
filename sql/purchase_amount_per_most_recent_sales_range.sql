select
  most_recent_sales_range
  , avg(purchase_amount) as mean_purchase_amount
from (
    select
      a.merchant_id
      , b.most_recent_sales_range
      , a.purchase_amount
    from
      Elo.concated_transactions as a
    left outer join
      Elo.merchants as b
    on
      a.merchant_id = b.merchant_id
    where
      b.merchant_id is not null
)
group by
  most_recent_sales_range
order by
  most_recent_sales_range
