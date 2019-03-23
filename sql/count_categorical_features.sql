select
  card_id
  , authorized_flag_ture/ card_id_count as authorized_flag_true_rate

  , category_1_true/ card_id_count as category_1_true_rate

  , category_2_1/ card_id_count as category_2_1_rate
  , category_2_2/ card_id_count as category_2_2_rate
  , category_2_3/ card_id_count as category_2_3_rate
  , category_2_4/ card_id_count as category_2_4_rate
  , category_2_5/ card_id_count as category_2_5_rate

  , category_3_A/ card_id_count as category_3_A_rate
  , category_3_B/ card_id_count as category_3_B_rate
  , category_3_C/ card_id_count as category_3_C_rate

  , category_4_true / card_id_count as category_4_true

  , installments_N / card_id_count as installments_N_rate
  , installments_0 / card_id_count as installments_0_rate
  , installments_1 / card_id_count as installments_1_rate
  , installments_2 / card_id_count as installments_2_rate
  , installments_3 / card_id_count as installments_3_rate
  , installments_4 / card_id_count as installments_4_rate
  , installments_5 / card_id_count as installments_5_rate
  , installments_6 / card_id_count as installments_6_rate
  , installments_7_ / card_id_count as installments_7__rate
  , installments_999 / card_id_count as installments_999_rate

  , month_lag_N13 / card_id_count as month_lag_N13_rate
  , month_lag_N12 / card_id_count as month_lag_N12_rate
  , month_lag_N11 / card_id_count as month_lag_N11_rate
  , month_lag_N10 / card_id_count as month_lag_N10_rate
  , month_lag_N9 / card_id_count as month_lag_N9_rate
  , month_lag_N8 / card_id_count as month_lag_N8_rate
  , month_lag_N7 / card_id_count as month_lag_N7_rate
  , month_lag_N6 / card_id_count as month_lag_N6_rate
  , month_lag_N5 / card_id_count as month_lag_N5_rate
  , month_lag_N4 / card_id_count as month_lag_N4_rate
  , month_lag_N3 / card_id_count as month_lag_N3_rate
  , month_lag_N2 / card_id_count as month_lag_N2_rate
  , month_lag_N1 / card_id_count as month_lag_N1_rate
  , month_lag_0 / card_id_count as month_lag_0_rate

  , most_recent_sales_range_A / card_id_count  as most_recent_sales_range_A_rate
  , most_recent_sales_range_B / card_id_count  as most_recent_sales_range_B_rate
  , most_recent_sales_range_C / card_id_count  as most_recent_sales_range_C_rate
  , most_recent_sales_range_D / card_id_count  as most_recent_sales_range_D_rate
  , most_recent_sales_range_E / card_id_count  as most_recent_sales_range_E_rate

  , most_recent_purchases_range_A / card_id_count  as most_recent_purchases_range_A_rate
  , most_recent_purchases_range_B / card_id_count  as most_recent_purchases_range_B_rate
  , most_recent_purchases_range_C / card_id_count  as most_recent_purchases_range_C_rate
  , most_recent_purchases_range_D / card_id_count  as most_recent_purchases_range_D_rate
  , most_recent_purchases_range_E / card_id_count  as most_recent_purchases_range_E_rate
from
  `Elo_processed.categorical_count`
