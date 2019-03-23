with tr as (
  select
    merchant_id
    , count(merchant_id) as tr_merchant_count
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
        b.card_id is not null
  )
  group by
    merchant_id
), te as (
  select
    merchant_id
    , count(merchant_id) as te_merchant_count
  from (
      select
        a.merchant_id
      from
        `Elo.concated_transactions` as a
      left outer join
        `Elo.test` as b
      on
        a.card_id = b.card_id
      where
        b.card_id is not null
  )
  group by
    merchant_id
)

select distinct
  merchant_id
  , case when tr_merchant_count is not null then tr_merchant_count else 0 end as tr_merchant_count
  , case when te_merchant_count is not null then te_merchant_count else 0 end as te_merchant_count
from (
    select
      tr.merchant_id
      , tr_merchant_count
      , te_merchant_count
    from
      tr
    left outer join
      te
    on
      tr.merchant_id = te.merchant_id
    union all
    select
      te.merchant_id
      , tr_merchant_count
      , te_merchant_count
    from
      te
    left outer join
      tr
    on
      tr.merchant_id = te.merchant_id
)
