with trs as (
    select
      card_id
      , city_id
      , count(city_id) as count_city_id
    from
      `Elo.concated_transactions`
    group by
      card_id
      , city_id
)

select
  a.card_id
  , min(a.city_id) as most_used_city_id
from
  trs as a
left outer join(
  select
    card_id
    , max(count_city_id) as max_
  from
    trs
  group by
    card_id
) as b
on
  a.card_id = b.card_id
and
  a.count_city_id = b.max_
where
  b.max_ is not null
group by
  card_id
