with trs as (
    select
      card_id
      , date(min(purchase_date)) as oldest_purchase_date
      ,date(max(purchase_date)) as latest_purchase_date
    from
      `Elo.concated_transactions`
    group by
      card_id
)

select
  tr.card_id
  , tr.feature
  , date_diff(tr.first_active_month, card.feature_oldest_active_month, day) as elapsed_from_feature_oldest_active_to_first_active
  , date_diff(oldest_purchase_date, first_active_month, day) as elapsed_from_oldest_purchase_date_to_first_active
  , date_diff(latest_purchase_date, oldest_purchase_date, day) as elapsed_from_oldest_purchase_date_to_latest_purchase_date
  , date_diff(current_date(), latest_purchase_date, day) as elapsed_from_latest_purchase_date
from (
  select
    card_id
    , concat(cast(feature_1 as string), cast(feature_2 as string), cast(feature_3 as string)) as feature
    , parse_date("%Y-%m", first_active_month) as first_active_month
  from
    Elo.train
  union all
  select
    card_id
    , concat(cast(feature_1 as string), cast(feature_2 as string), cast(feature_3 as string)) as feature
    , parse_date("%Y-%m", first_active_month) as first_active_month
  from
    Elo.test
) as tr
left outer join
  trs
on
  tr.card_id = trs.card_id
left outer join
  `Elo_processed.oldest_active_month__per__card_feature` as card
on
  tr.feature = card.feature
