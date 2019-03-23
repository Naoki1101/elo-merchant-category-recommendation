select
  card_id
  , count(card_id) as nunique_merchant
from (
    select distinct
      card_id
      , merchant_id
    from
      `Elo.concated_transactions`
)
group by
  card_id
