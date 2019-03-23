select
  card_id
  , sum(case when purchase_date between "2017-01-01" and "2017-01-31" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_Jan_2017
  , sum(case when purchase_date between "2017-02-01" and "2017-02-28" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_Feb_2017
  , sum(case when purchase_date between "2017-03-01" and "2017-03-31" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_Mar_2017
  , sum(case when purchase_date between "2017-04-01" and "2017-04-30" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_Apr_2017
  , sum(case when purchase_date between "2017-05-01" and "2017-05-31" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_May_2017
  , sum(case when purchase_date between "2017-06-01" and "2017-06-30" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_Jun_2017
  , sum(case when purchase_date between "2017-07-01" and "2017-07-31" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_Jul_2017
  , sum(case when purchase_date between "2017-08-01" and "2017-08-31" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_Aug_2017
  , sum(case when purchase_date between "2017-09-01" and "2017-09-30" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_Sep_2017
  , sum(case when purchase_date between "2017-10-01" and "2017-10-31" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_Oct_2017
  , sum(case when purchase_date between "2017-11-01" and "2017-11-30" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_Nov_2017
  , sum(case when purchase_date between "2017-12-01" and "2017-12-31" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_Dec_2017
  , sum(case when purchase_date between "2018-01-01" and "2018-01-31" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_Jan_2018
  , sum(case when purchase_date between "2018-02-01" and "2018-02-28" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_Feb_2018
  , sum(case when purchase_date between "2018-03-01" and "2018-03-31" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_Mar_2018
  , sum(case when purchase_date between "2018-04-01" and "2018-04-30" then purchase_sig_amount else 0 end) as sum_purchase_amount_in_Apr_2018


  , sum(case when purchase_date between "2017-01-01" and "2017-01-31"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount) as rate_purchase_amount_in_Jan_2017
  , sum(case when purchase_date between "2017-02-01" and "2017-02-28"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount) as rate_purchase_amount_in_Feb_2017
  , sum(case when purchase_date between "2017-03-01" and "2017-03-31"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount)as rate_purchase_amount_in_Mar_2017
  , sum(case when purchase_date between "2017-04-01" and "2017-04-30"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount) as rate_purchase_amount_in_Apr_2017
  , sum(case when purchase_date between "2017-05-01" and "2017-05-31"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount) as rate_purchase_amount_in_May_2017
  , sum(case when purchase_date between "2017-06-01" and "2017-06-30"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount) as rate_purchase_amount_in_Jun_2017
  , sum(case when purchase_date between "2017-07-01" and "2017-07-31"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount) as rate_purchase_amount_in_Jul_2017
  , sum(case when purchase_date between "2017-08-01" and "2017-08-31"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount) as rate_purchase_amount_in_Aug_2017
  , sum(case when purchase_date between "2017-09-01" and "2017-09-30"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount) as rate_purchase_amount_in_Sep_2017
  , sum(case when purchase_date between "2017-10-01" and "2017-10-31"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount) as rate_purchase_amount_in_Oct_2017
  , sum(case when purchase_date between "2017-11-01" and "2017-11-30"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount) as rate_purchase_amount_in_Nov_2017
  , sum(case when purchase_date between "2017-12-01" and "2017-12-31"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount) as rate_purchase_amount_in_Dec_2017
  , sum(case when purchase_date between "2018-01-01" and "2018-01-31"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount) as rate_purchase_amount_in_Jan_2018
  , sum(case when purchase_date between "2018-02-01" and "2018-02-28"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount) as rate_purchase_amount_in_Feb_2018
  , sum(case when purchase_date between "2018-03-01" and "2018-03-31"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount) as rate_purchase_amount_in_Mar_2018
  , sum(case when purchase_date between "2018-04-01" and "2018-04-30"
      then purchase_sig_amount else 0 end) / sum(purchase_sig_amount) as rate_purchase_amount_in_Apr_2018
from(
  select
    card_id
    , date(purchase_date) as purchase_date
    , 1/(1 + exp(-1*purchase_amount)) as purchase_sig_amount
  from
    `Elo.concated_transactions`
)
group by
  card_id
