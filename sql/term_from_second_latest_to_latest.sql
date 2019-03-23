with trs as (
    select
      a.card_id
      , a.purchase_date
    from
      `Elo.concated_transactions` as a
    left outer join
      `Elo_processed.latest_purchase_date__per__card_id` as b
    on
      a.card_id = b.card_id
    and
      a.purchase_date = b.latest_purchase_date
    where
      b.latest_purchase_date is null
    )

select
  latest.card_id
  , date_diff(date(latest.latest_purchase_date), date(second.second_latest_purchase_date), day) as elapsed_from_second_latest_to_latest
from
  `Elo_processed.latest_purchase_date__per__card_id` as latest
left outer join (
    select
      card_id
      , max(purchase_date) as second_latest_purchase_date
    from
      trs
    group by
      card_id
) as second
on
  latest.card_id = second.card_id
