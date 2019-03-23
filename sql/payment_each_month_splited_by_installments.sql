SELECT
  card_id
  , SUM(CASE WHEN purchase_month = "2017-01" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201701
  , SUM(CASE WHEN purchase_month = "2017-02" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201702
  , SUM(CASE WHEN purchase_month = "2017-03" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201703
  , SUM(CASE WHEN purchase_month = "2017-04" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201704
  , SUM(CASE WHEN purchase_month = "2017-05" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201705
  , SUM(CASE WHEN purchase_month = "2017-06" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201706
  , SUM(CASE WHEN purchase_month = "2017-07" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201707
  , SUM(CASE WHEN purchase_month = "2017-08" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201708
  , SUM(CASE WHEN purchase_month = "2017-09" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201709
  , SUM(CASE WHEN purchase_month = "2017-10" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201710
  , SUM(CASE WHEN purchase_month = "2017-11" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201711
  , SUM(CASE WHEN purchase_month = "2017-12" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201712
  , SUM(CASE WHEN purchase_month = "2018-01" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201801
  , SUM(CASE WHEN purchase_month = "2018-02" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201802
  , SUM(CASE WHEN purchase_month = "2018-03" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201803
  , SUM(CASE WHEN purchase_month = "2018-04" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201804
  , SUM(CASE WHEN purchase_month = "2018-05" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201805
  , SUM(CASE WHEN purchase_month = "2018-06" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201806
  , SUM(CASE WHEN purchase_month = "2018-07" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201807
  , SUM(CASE WHEN purchase_month = "2018-08" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201808
  , SUM(CASE WHEN purchase_month = "2018-09" THEN sig_purchase_amount ELSE 0 END) AS sum_payment_201809
FROM (
    SELECT
      card_id
      , sig_purchase_amount
      , SUBSTR(CAST(purchase_date AS STRING),1,7) AS purchase_month
    FROM(
        SELECT
          card_id
          , installments
          , 1/(1+EXP(-1*purchase_amount)) AS sig_purchase_amount
          , DATE(purchase_date) AS purchase_date
        FROM
          `Elo.concated_transactions`
        WHERE
          installments >= 0
        AND
          installments <> 999
        AND
          authorized_flag = true

        UNION ALL

        SELECT
          card_id
          , installments
          , 1/(1+EXP(-1*purchase_amount)) AS sig_purchase_amount
          , DATE(purchase_date) AS purchase_date
        FROM
          `Elo.concated_transactions`
        WHERE
          installments >= 1
        AND
          installments <> 999
        AND
          authorized_flag = true

        UNION ALL

        SELECT
          card_id
          , installments
          , 1/(1+EXP(-1*purchase_amount)) / installments AS sig_purchase_amount
          , DATE_ADD(DATE(purchase_date), INTERVAL 1 MONTH) AS purchase_date
        FROM
          `Elo.concated_transactions`
        WHERE
          installments  >= 2
        AND
          installments <> 999
        AND
          authorized_flag = true

        UNION ALL

        SELECT
          card_id
          , installments
          , 1/(1+EXP(-1*purchase_amount)) / installments AS sig_purchase_amount
          , DATE_ADD(DATE(purchase_date), INTERVAL 2 MONTH) AS purchase_date
        FROM
          `Elo.concated_transactions`
        WHERE
          installments  >= 3
        AND
          installments <> 999
        AND
          authorized_flag = true

        UNION ALL

        SELECT
          card_id
          , installments
          , 1/(1+EXP(-1*purchase_amount)) / installments AS sig_purchase_amount
          , DATE_ADD(DATE(purchase_date), INTERVAL 3 MONTH) AS purchase_date
        FROM
          `Elo.concated_transactions`
        WHERE
          installments  >= 4
        AND
          installments <> 999
        AND
          authorized_flag = true

        UNION ALL

        SELECT
          card_id
          , installments
          , 1/(1+EXP(-1*purchase_amount)) / installments AS sig_purchase_amount
          , DATE_ADD(DATE(purchase_date), INTERVAL 4 MONTH) AS purchase_date
        FROM
          `Elo.concated_transactions`
        WHERE
          installments  >= 5
        AND
          installments <> 999
        AND
          authorized_flag = true

        UNION ALL

        SELECT
          card_id
          , installments
          , 1/(1+EXP(-1*purchase_amount)) / installments AS sig_purchase_amount
          , DATE_ADD(DATE(purchase_date), INTERVAL 5 MONTH) AS purchase_date
        FROM
          `Elo.concated_transactions`
        WHERE
          installments  >= 6
        AND
          installments <> 999
        AND
          authorized_flag = true

        UNION ALL

        SELECT
          card_id
          , installments
          , 1/(1+EXP(-1*purchase_amount)) / installments AS sig_purchase_amount
          , DATE_ADD(DATE(purchase_date), INTERVAL 6 MONTH) AS purchase_date
        FROM
          `Elo.concated_transactions`
        WHERE
          installments  >= 7
        AND
          installments <> 999
        AND
          authorized_flag = true

        UNION ALL

        SELECT
          card_id
          , installments
          , 1/(1+EXP(-1*purchase_amount)) / installments AS sig_purchase_amount
          , DATE_ADD(DATE(purchase_date), INTERVAL 7 MONTH) AS purchase_date
        FROM
          `Elo.concated_transactions`
        WHERE
          installments  >= 8
        AND
          installments <> 999
        AND
          authorized_flag = true

        UNION ALL

        SELECT
          card_id
          , installments
          , 1/(1+EXP(-1*purchase_amount)) / installments AS sig_purchase_amount
          , DATE_ADD(DATE(purchase_date), INTERVAL 8 MONTH) AS purchase_date
        FROM
          `Elo.concated_transactions`
        WHERE
          installments  >= 9
        AND
          installments <> 999
        AND
          authorized_flag = true

        UNION ALL

        SELECT
          card_id
          , installments
          , 1/(1+EXP(-1*purchase_amount)) / installments AS sig_purchase_amount
          , DATE_ADD(DATE(purchase_date), INTERVAL 9 MONTH) AS purchase_date
        FROM
          `Elo.concated_transactions`
        WHERE
          installments  >= 10
        AND
          installments <> 999
        AND
          authorized_flag = true

        UNION ALL

        SELECT
          card_id
          , installments
          , 1/(1+EXP(-1*purchase_amount)) / installments AS sig_purchase_amount
          , DATE_ADD(DATE(purchase_date), INTERVAL 10 MONTH) AS purchase_date
        FROM
          `Elo.concated_transactions`
        WHERE
          installments  >= 11
        AND
          installments <> 999
        AND
          authorized_flag = true

        UNION ALL

        SELECT
          card_id
          , installments
          , 1/(1+EXP(-1*purchase_amount)) / installments AS sig_purchase_amount
          , DATE_ADD(DATE(purchase_date), INTERVAL 11 MONTH) AS purchase_date
        FROM
          `Elo.concated_transactions`
        WHERE
          installments  = 12
        AND
          installments <> 999
        AND
          authorized_flag = true
    )
    WHERE
      purchase_date <=  "2018-09-30"
)
GROUP BY
  card_id
