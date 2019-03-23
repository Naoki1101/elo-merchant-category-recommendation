select
  a.card_id
  , sum(b.outliers_rank) as sum_outliers_rank
  , avg(b.outliers_rank) as mean_outliers_rank
  , min(b.outliers_rank) as min_outliers_rank
  , max(b.outliers_rank) as max_outliers_rank
from
  `Elo.concated_transactions` as a
left outer join
  `Elo_processed.outliers_rank__per__merchant_id` as b
on
  a.merchant_id = b.merchant_id
group by
  a.card_id
