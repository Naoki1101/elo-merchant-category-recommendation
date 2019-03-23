select
  a.card_id
  , case when b.card_id is not null then 1 else 0 end as new_merchant_trs_flag
from (
    select distinct
      card_id
    from
      `Elo.concated_transactions`
)as a
left outer join (
    select distinct
      card_id
    from
      `Elo.new_merchant_transactions`
) as b
on
  a.card_id = b.card_id
