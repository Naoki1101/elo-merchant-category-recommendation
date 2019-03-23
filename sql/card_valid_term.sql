with latest as (
    select
      card_id
      , max(purchase_date) as latest_date
    from
      `Elo.historical_transactions`
    group by
      card_id
)

select
  card_id
  , date_diff(card_expire_date, first_active_date, day) as card_valid_term
from(
    select distinct
      a.card_id
      , case when a.month_lag = 0 then date(purchase_date) else date_add(date(purchase_date), interval -1*a.month_lag month) end as card_expire_date
      , t.first_active_date
    from
      `Elo.historical_transactions` as a
    left outer join
      latest as b
    on
      a.card_id = b.card_id
    and
      a.purchase_date = b.latest_date
    left outer join (
      select
        card_id
        , parse_date("%Y-%m", first_active_month) as first_active_date
      from
        `Elo.train`
      union all
      select
        card_id
        , parse_date("%Y-%m", first_active_month) as first_active_date
      from
        `Elo.test`
    ) as t
    on
      a.card_id = t.card_id
    where
      b.latest_date is not null
)
