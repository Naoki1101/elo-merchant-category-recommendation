with mer as (
    select
      a.merchant_id
      , out_count_rate
    from
      `Elo_processed.outliers_rate__per__merchant_id` as a
    inner join (
        select
          merchant_id
          , tr_merchant_count
          , te_merchant_count
        from
          `Elo_processed.merchant_count_tr_te`
        where
          te_merchant_count > 25
    ) as b
    on
      a.merchant_id = b.merchant_id
)

select
  a.card_id
  , sum(b.out_count_rate) as sum_out_count_rate
  , avg(b.out_count_rate) as mean_out_count_rate
  , min(b.out_count_rate) as min_out_count_rate
  , max(b.out_count_rate) as max_out_count_rate
from
  `Elo.concated_transactions` as a
left outer join
  mer as b
on
  a.merchant_id = b.merchant_id
group by
  a.card_id
