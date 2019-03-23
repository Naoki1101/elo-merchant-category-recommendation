with trs as (
  select
    a.authorized_flag
    , date_diff(current_date(), date(a.purchase_date), day) as latest
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
  , sum(case when authorized_flag = true then 1 else 0 end) as authorized_flag_ture_weighted_elapsed

  , sum(case when category_1 = true then 1 else 0 end) as category_1_true_weighted_elapsed

  , sum(case when category_2 = 1.0 then exp(-1*latest/100) else 0 end) as category_2_1_weighted_elapsed
  , sum(case when category_2 = 2.0 then exp(-1*latest/100) else 0 end) as category_2_2_weighted_elapsed
  , sum(case when category_2 = 3.0 then exp(-1*latest/100) else 0 end) as category_2_3_weighted_elapsed
  , sum(case when category_2 = 4.0 then exp(-1*latest/100) else 0 end) as category_2_4_weighted_elapsed
  , sum(case when category_2 = 5.0 then exp(-1*latest/100) else 0 end) as category_2_5_weighted_elapsed

  , sum(case when category_3 = "A" then exp(-1*latest/100) else 0 end) as category_3_A_weighted_elapsed
  , sum(case when category_3 = "B" then exp(-1*latest/100) else 0 end) as category_3_B_weighted_elapsed
  , sum(case when category_3 = "C" then exp(-1*latest/100) else 0 end) as category_3_C_weighted_elapsed

  , sum(case when category_4 = true then exp(-1*latest/100) else 0 end) as category_4_true_weighted_elapsed

  , sum(case when installments = -1 then exp(-1*latest/100) else 0 end) as installments_N_weighted_elapsed
  , sum(case when installments = 0 then exp(-1*latest/100) else 0 end) as installments_0_weighted_elapsed
  , sum(case when installments = 1 then exp(-1*latest/100) else 0 end) as installments_1_weighted_elapsed
  , sum(case when installments = 2 then exp(-1*latest/100) else 0 end) as installments_2_weighted_elapsed
  , sum(case when installments = 3 then exp(-1*latest/100) else 0 end) as installments_3_weighted_elapsed
  , sum(case when installments = 4 then exp(-1*latest/100) else 0 end) as installments_4_weighted_elapsed
  , sum(case when installments = 5 then exp(-1*latest/100) else 0 end) as installments_5_weighted_elapsed
  , sum(case when installments = 6 then exp(-1*latest/100) else 0 end) as installments_6_weighted_elapsed
  , sum(case when installments >= 7 then exp(-1*latest/100) else 0 end) as installments_7__weighted_elapsed
  , sum(case when installments = 999 then exp(-1*latest/100) else 0 end) as installments_999_weighted_elapsed

  , sum(case when month_lag = -13 then exp(-1*latest/100) else 0 end) as month_lag_N13_weighted_elapsed
  , sum(case when month_lag = -12 then exp(-1*latest/100) else 0 end) as month_lag_N12_weighted_elapsed
  , sum(case when month_lag = -11 then exp(-1*latest/100) else 0 end) as month_lag_N11_weighted_elapsed
  , sum(case when month_lag = -10 then exp(-1*latest/100) else 0 end) as month_lag_N10_weighted_elapsed
  , sum(case when month_lag = -9 then exp(-1*latest/100) else 0 end) as month_lag_N9_weighted_elapsed
  , sum(case when month_lag = -8 then exp(-1*latest/100) else 0 end) as month_lag_N8_weighted_elapsed
  , sum(case when month_lag = -7 then exp(-1*latest/100) else 0 end) as month_lag_N7_weighted_elapsed
  , sum(case when month_lag = -6 then exp(-1*latest/100) else 0 end) as month_lag_N6_weighted_elapsed
  , sum(case when month_lag = -5 then exp(-1*latest/100) else 0 end) as month_lag_N5_weighted_elapsed
  , sum(case when month_lag = -4 then exp(-1*latest/100) else 0 end) as month_lag_N4_weighted_elapsed
  , sum(case when month_lag = -3 then exp(-1*latest/100) else 0 end) as month_lag_N3_weighted_elapsed
  , sum(case when month_lag = -2 then exp(-1*latest/100) else 0 end) as month_lag_N2_weighted_elapsed
  , sum(case when month_lag = -1 then exp(-1*latest/100) else 0 end) as month_lag_N1_weighted_elapsed
  , sum(case when month_lag = 0 then exp(-1*latest/100) else 0 end) as month_lag_0_weighted_elapsed

  , sum(case when most_recent_sales_range = "A" then exp(-1*latest/100) else 0 end) as most_recent_sales_range_A_weighted_elapsed
  , sum(case when most_recent_sales_range = "B" then exp(-1*latest/100) else 0 end) as most_recent_sales_range_B_weighted_elapsed
  , sum(case when most_recent_sales_range = "C" then exp(-1*latest/100) else 0 end) as most_recent_sales_range_C_weighted_elapsed
  , sum(case when most_recent_sales_range = "D" then exp(-1*latest/100) else 0 end) as most_recent_sales_range_D_weighted_elapsed
  , sum(case when most_recent_sales_range = "E" then exp(-1*latest/100) else 0 end) as most_recent_sales_range_E_weighted_elapsed

  , sum(case when most_recent_purchases_range = "A" then exp(-1*latest/100) else 0 end) as most_recent_purchases_range_A_weighted_elapsed
  , sum(case when most_recent_purchases_range = "B" then exp(-1*latest/100) else 0 end) as most_recent_purchases_range_B_weighted_elapsed
  , sum(case when most_recent_purchases_range = "C" then exp(-1*latest/100) else 0 end) as most_recent_purchases_range_C_weighted_elapsed
  , sum(case when most_recent_purchases_range = "D" then exp(-1*latest/100) else 0 end) as most_recent_purchases_range_D_weighted_elapsed
  , sum(case when most_recent_purchases_range = "E" then exp(-1*latest/100) else 0 end) as most_recent_purchases_range_E_weighted_elapsed
from
  trs
group by
  card_id
