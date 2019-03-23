select
  card_id
  , sum(case when time(purchase_date)="00:00:00" then 1 else 0 end) as count_purchase_just_at_24
  , sum(case when time(purchase_date)="00:00:00" then 1 else 0 end) / count(card_id) as rate_purchase_just_at_24
from
  `Elo.historical_transactions`
group by
  card_id
order by
  3 desc
