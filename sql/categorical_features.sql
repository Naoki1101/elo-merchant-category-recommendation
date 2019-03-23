with trs as (
  select
    a.authorized_flag
    , a.card_id
    , a.category_1
    , a.category_2
    , a.category_3
    , b.category_4
    , a.installments
    , a.month_lag
    , b.most_recent_sales_range
    , b.most_recent_purchases_range
  from
    `Elo.concated_transactions` as a
  left outer join
    Elo.merchants as b
  on
    a.merchant_id = b.merchant_id
  and
    a.merchant_category_id = b.merchant_category_id
  and
    a.subsector_id = b.subsector_id
  and
    a.category_1 = b.category_1
  and
    a.category_2 = b.category_2
  and
    a.city_id = b.city_id
  and
    a.state_id = b.state_id
)

select
  card_id
  , count(card_id) as card_id_count


  , sum(case when authorized_flag = true then 1 else 0 end) as authorized_flag_ture
  , sum(case when authorized_flag = true then 1 else 0 end) / count(card_id) as authorized_flag_ture_rate


  , sum(case when category_1 = true then 1 else 0 end) as category_1_true
  , sum(case when category_1 = true then 1 else 0 end) / count(card_id) as category_1_true_rate


  , sum(case when category_2 = 1.0 then 1 else 0 end) as category_2_1
  , sum(case when category_2 = 2.0 then 1 else 0 end) as category_2_2
  , sum(case when category_2 = 3.0 then 1 else 0 end) as category_2_3
  , sum(case when category_2 = 4.0 then 1 else 0 end) as category_2_4
  , sum(case when category_2 = 5.0 then 1 else 0 end) as category_2_5
  , sum(case when category_2 = 1.0 then 1 else 0 end) / count(card_id) as category_2_1_rate
  , sum(case when category_2 = 2.0 then 1 else 0 end) / count(card_id) as category_2_2_rate
  , sum(case when category_2 = 3.0 then 1 else 0 end) / count(card_id) as category_2_3_rate
  , sum(case when category_2 = 4.0 then 1 else 0 end) / count(card_id) as category_2_4_rate
  , sum(case when category_2 = 5.0 then 1 else 0 end) / count(card_id) as category_2_5_rate


  , sum(case when category_3 = "A" then 1 else 0 end) as category_3_A
  , sum(case when category_3 = "B" then 1 else 0 end) as category_3_B
  , sum(case when category_3 = "C" then 1 else 0 end) as category_3_C
  , sum(case when category_3 = "A" then 1 else 0 end) / count(card_id) as category_3_A_rate
  , sum(case when category_3 = "B" then 1 else 0 end) / count(card_id) as category_3_B_rate
  , sum(case when category_3 = "C" then 1 else 0 end) / count(card_id) as category_3_C_rate

  , sum(case when category_4 = true then 1 else 0 end) as category_4_true
  , sum(case when category_4 = true then 1 else 0 end) / count(card_id) as category_4_true_rate

  , sum(case when installments = -1 or installments = 999 then 1 else 0 end) as installments_N
  , sum(case when installments = 0 then 1 else 0 end) as installments_0
  , sum(case when installments = 1 then 1 else 0 end) as installments_1
  , sum(case when installments = 2 then 1 else 0 end) as installments_2
  , sum(case when installments = 3 then 1 else 0 end) as installments_3
  , sum(case when installments = 4 then 1 else 0 end) as installments_4
  , sum(case when installments = 5 then 1 else 0 end) as installments_5
  , sum(case when installments = 6 then 1 else 0 end) as installments_6
  , sum(case when installments >= 7 then 1 else 0 end) as installments_7_
  , sum(case when installments = -1 or installments = 999 then 1 else 0 end) / count(card_id) as installments_N_rate
  , sum(case when installments = 0 then 1 else 0 end) / count(card_id) as installments_0_rate
  , sum(case when installments = 1 then 1 else 0 end) / count(card_id) as installments_1_rate
  , sum(case when installments = 2 then 1 else 0 end) / count(card_id) as installments_2_rate
  , sum(case when installments = 3 then 1 else 0 end) / count(card_id) as installments_3_rate
  , sum(case when installments = 4 then 1 else 0 end) / count(card_id) as installments_4_rate
  , sum(case when installments = 5 then 1 else 0 end) / count(card_id) as installments_5_rate
  , sum(case when installments = 6 then 1 else 0 end) / count(card_id) as installments_6_rate
  , sum(case when installments >= 7 then 1 else 0 end) / count(card_id) as installments_7__rate


  , sum(case when month_lag = -13 then 1 else 0 end) as month_lag_N13
  , sum(case when month_lag = -12 then 1 else 0 end) as month_lag_N12
  , sum(case when month_lag = -11 then 1 else 0 end) as month_lag_N11
  , sum(case when month_lag = -10 then 1 else 0 end) as month_lag_N10
  , sum(case when month_lag = -9 then 1 else 0 end) as month_lag_N9
  , sum(case when month_lag = -8 then 1 else 0 end) as month_lag_N8
  , sum(case when month_lag = -7 then 1 else 0 end) as month_lag_N7
  , sum(case when month_lag = -6 then 1 else 0 end) as month_lag_N6
  , sum(case when month_lag = -5 then 1 else 0 end) as month_lag_N5
  , sum(case when month_lag = -4 then 1 else 0 end) as month_lag_N4
  , sum(case when month_lag = -3 then 1 else 0 end) as month_lag_N3
  , sum(case when month_lag = -2 then 1 else 0 end) as month_lag_N2
  , sum(case when month_lag = -1 then 1 else 0 end) as month_lag_N1
  , sum(case when month_lag = 0 then 1 else 0 end) as month_lag_0
  , sum(case when month_lag = 1 then 1 else 0 end) as month_lag_1
  , sum(case when month_lag = 2 then 1 else 0 end) as month_lag_2
  , sum(case when month_lag = -13 then 1 else 0 end) / count(card_id) as month_lag_N13_rate
  , sum(case when month_lag = -12 then 1 else 0 end) /　count(card_id) as month_lag_N12_rate
  , sum(case when month_lag = -11 then 1 else 0 end) /　count(card_id) as month_lag_N11_rate
  , sum(case when month_lag = -10 then 1 else 0 end) /　count(card_id) as month_lag_N10_rate
  , sum(case when month_lag = -9 then 1 else 0 end) /　count(card_id) as month_lag_N9_rate
  , sum(case when month_lag = -8 then 1 else 0 end) /　count(card_id) as month_lag_N8_rate
  , sum(case when month_lag = -7 then 1 else 0 end) /　count(card_id) as month_lag_N7_rate
  , sum(case when month_lag = -6 then 1 else 0 end) /　count(card_id) as month_lag_N6_rate
  , sum(case when month_lag = -5 then 1 else 0 end) /　count(card_id) as month_lag_N5_rate
  , sum(case when month_lag = -4 then 1 else 0 end) /　count(card_id) as month_lag_N4_rate
  , sum(case when month_lag = -3 then 1 else 0 end) /　count(card_id) as month_lag_N3_rate
  , sum(case when month_lag = -2 then 1 else 0 end) /　count(card_id) as month_lag_N2_rate
  , sum(case when month_lag = -1 then 1 else 0 end) /　count(card_id) as month_lag_N1_rate
  , sum(case when month_lag = 0 then 1 else 0 end) /　count(card_id) as month_lag_0_rate
  , sum(case when month_lag = 1 then 1 else 0 end) /　count(card_id) as month_lag_1_rate
  , sum(case when month_lag = 2 then 1 else 0 end) /　count(card_id) as month_lag_2_rate

  , sum(case when most_recent_sales_range = "A" then 1 else 0 end) as most_recent_sales_range_A
  , sum(case when most_recent_sales_range = "B" then 1 else 0 end) as most_recent_sales_range_B
  , sum(case when most_recent_sales_range = "C" then 1 else 0 end) as most_recent_sales_range_C
  , sum(case when most_recent_sales_range = "D" then 1 else 0 end) as most_recent_sales_range_D
  , sum(case when most_recent_sales_range = "E" then 1 else 0 end) as most_recent_sales_range_E
  , sum(case when most_recent_sales_range = "A" then 1 else 0 end) /　count(card_id) as most_recent_sales_range_A_rate
  , sum(case when most_recent_sales_range = "B" then 1 else 0 end) /　count(card_id) as most_recent_sales_range_B_rate
  , sum(case when most_recent_sales_range = "C" then 1 else 0 end) /　count(card_id) as most_recent_sales_range_C_rate
  , sum(case when most_recent_sales_range = "D" then 1 else 0 end) /　count(card_id) as most_recent_sales_range_D_rate
  , sum(case when most_recent_sales_range = "E" then 1 else 0 end) /　count(card_id) as most_recent_sales_range_E_rate

  , sum(case when most_recent_purchases_range = "A" then 1 else 0 end) as most_recent_purchases_range_A
  , sum(case when most_recent_purchases_range = "B" then 1 else 0 end) as most_recent_purchases_range_B
  , sum(case when most_recent_purchases_range = "C" then 1 else 0 end) as most_recent_purchases_range_C
  , sum(case when most_recent_purchases_range = "D" then 1 else 0 end) as most_recent_purchases_range_D
  , sum(case when most_recent_purchases_range = "E" then 1 else 0 end) as most_recent_purchases_range_E
  , sum(case when most_recent_purchases_range = "A" then 1 else 0 end) /　count(card_id) as most_recent_purchases_range_A_rate
  , sum(case when most_recent_purchases_range = "B" then 1 else 0 end) /　count(card_id) as most_recent_purchases_range_B_rate
  , sum(case when most_recent_purchases_range = "C" then 1 else 0 end) /　count(card_id) as most_recent_purchases_range_C_rate
  , sum(case when most_recent_purchases_range = "D" then 1 else 0 end) /　count(card_id) as most_recent_purchases_range_D_rate
  , sum(case when most_recent_purchases_range = "E" then 1 else 0 end) /　count(card_id) as most_recent_purchases_range_E_rate
from
  trs
group by
  card_id
