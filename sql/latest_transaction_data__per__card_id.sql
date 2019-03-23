with trs as (
  select
    a.authorized_flag
    , a.card_id
    , a.city_id
    , a.category_1
    , a.category_2
    , a.category_3
    , b.category_4
    , a.installments
    , a.merchant_category_id
    , b.merchant_group_id
    , b.numerical_1
    , a.month_lag
    , a.purchase_amount
    , a.purchase_date
    , a.state_id
    , a.subsector_id
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
  trs.card_id

  , avg(case when trs.authorized_flag = true then 1 else 0 end) as authorized_flag_latest_trs

  , avg(case when trs.category_1 = true then 1 else 0 end) as category_1_true_latest_trs

  , avg(category_2) as category_2_latest_trs

  , avg(case when trs.category_3 = "A" then 1 else 0 end) as category_3_A_latest_trs
  , avg(case when trs.category_3 = "B" then 1 else 0 end) as category_3_B_latest_trs
  , avg(case when trs.category_3 = "C" then 1 else 0 end) as category_3_C_latest_trs

  , avg(case when trs.category_4 = true then 1 else 0 end) as category_4_true_latest_trs
  , avg(case when trs.category_4 is null then 1 else 0 end) as category_4_null_latest_trs

  , avg(trs.installments) as installments_latest_trs

  , avg(trs.numerical_1) as numerical_1_latest_trs
  , avg(case when trs.numerical_1 is null then 1 else 0 end) as numerical_1_null_latest_trs

  , avg(trs.month_lag) as month_lag_latest_trs

  , avg(trs.purchase_amount) as purchase_amount_latest_trs

  , avg(case when trs.most_recent_sales_range = "A" then 1 else 0 end) as most_recent_sales_range_A_latest_trs
  , avg(case when trs.most_recent_sales_range = "B" then 1 else 0 end) as most_recent_sales_range_B_latest_trs
  , avg(case when trs.most_recent_sales_range = "C" then 1 else 0 end) as most_recent_sales_range_C_latest_trs
  , avg(case when trs.most_recent_sales_range = "D" then 1 else 0 end) as most_recent_sales_range_D_latest_trs
  , avg(case when trs.most_recent_sales_range = "E" then 1 else 0 end) as most_recent_sales_range_E_latest_trs
  , avg(case when trs.most_recent_sales_range is null then 1 else 0 end) as most_recent_sales_range_null_latest_trs

  , avg(case when trs.most_recent_purchases_range = "A" then 1 else 0 end) as most_recent_purchases_range_A_latest_trs
  , avg(case when trs.most_recent_purchases_range = "B" then 1 else 0 end) as most_recent_purchases_range_B_latest_trs
  , avg(case when trs.most_recent_purchases_range = "C" then 1 else 0 end) as most_recent_purchases_range_C_latest_trs
  , avg(case when trs.most_recent_purchases_range = "D" then 1 else 0 end) as most_recent_purchases_range_D_latest_trs
  , avg(case when trs.most_recent_purchases_range = "E" then 1 else 0 end) as most_recent_purchases_range_E_latest_trs
  , avg(case when trs.most_recent_purchases_range is null then 1 else 0 end) as most_recent_purchases_range_null_latest_trs
from
  trs as trs
left outer join
  `Elo_processed.latest_purchase_date__per__card_id`  as b
on
  trs.card_id = b.card_id
and
  trs.purchase_date = b.latest_purchase_date
where
  b.latest_purchase_date is not null
group by
  trs.card_id
