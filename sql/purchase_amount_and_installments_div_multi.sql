with trs as (
  select
    card_id
    , installments
    , 1/(1+exp(-1*purchase_amount)) as sig_purchase_amount
  from(
    select
      card_id
      , authorized_flag
      , installments
      , purchase_amount
    from
      `Elo.historical_transactions`
    union all
    select
      card_id
      , authorized_flag
      , installments
      , purchase_amount
    from
      `Elo.new_merchant_transactions`
  )
  where
    installments is not null
  and
    installments <> -1
  and
    installments <> 999
  and
    authorized_flag = true
)


select
  card_id
  , avg(sig_purchase_amount/(installments+1)) as mean_sig_purchase_amount__div__installments
  , avg(sig_purchase_amount * (installments+1)) as mean_sig_purchase_amount__multi__installments
from
  trs
group by
  card_id
