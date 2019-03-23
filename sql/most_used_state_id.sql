with trs as (
    select
      card_id
      , state_id
      , count(state_id) as count_state_id
    from
      `Elo.concated_transactions`
    group by
      card_id
      , state_id
)

select
  a.card_id
  , min(a.state_id) as most_used_state_id
from
  trs as a
left outer join(
  select
    card_id
    , max(count_state_id) as max_
  from
    trs
  group by
    card_id
) as b
on
  a.card_id = b.card_id
and
  a.count_state_id = b.max_
where
  b.max_ is not null
group by
  card_id
