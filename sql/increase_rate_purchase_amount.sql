WITH h_trs AS (
  SELECT
    card_id
    , AVG(purchase_amount/ 0.00150265118 + 497.06) AS h_purchase_amount
  FROM
    `Elo.historical_transactions`
  GROUP BY
    card_id
),

n_trs AS (
  SELECT
    card_id
    , AVG(purchase_amount/ 0.00150265118 + 497.06) AS n_purchase_amount
  FROM
    `Elo.new_merchant_transactions`
  GROUP BY
    card_id
)

SELECT
  card_id
  , CASE WHEN n_purchase_amount <> 0 THEN h_purchase_amount/n_purchase_amount ELSE 0 END AS h_purchase_amount_div_n_purchase_amount
FROM (
  SELECT
    h_trs.card_id
    , h_purchase_amount
    , CASE WHEN n_purchase_amount IS NOT NULL THEN n_purchase_amount ELSE 0 END AS n_purchase_amount
  FROM
    h_trs
  LEFT OUTER JOIN
    n_trs
  ON
    h_trs.card_id = n_trs.card_id
)
