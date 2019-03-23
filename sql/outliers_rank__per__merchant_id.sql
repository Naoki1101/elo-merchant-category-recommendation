with all_merchant as (
  select
    merchant_id
    , count(merchant_id) as all_count
  from
    `Elo.concated_transactions`
  group by
    merchant_id
), out_merchant as (
  select
    merchant_id
    , count(merchant_id) as out_count
  from (
    select
      a.merchant_id
    from
      `Elo.concated_transactions` as a
    left outer join
       `Elo.train` as b
     on
      a.card_id = b.card_id
    where
      b.target < -30
    )
  group by
    merchant_id
)

select
  merchant_id
  , pow(out_count, out_count_rate) as outliers_rank
from(
    select
      merchant_id
      , all_count
      , out_count
      , case when all_count <> 0 then out_count / all_count else 0 end as out_count_rate
    from(
        select
          a.merchant_id
          , a.all_count
          , case when b.out_count is not null then b.out_count else 0 end as out_count
        from
          all_merchant as a
        left outer join
          out_merchant as b
        on
          a.merchant_id = b.merchant_id
    )
)
order by
  outliers_rank desc;
