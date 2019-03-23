WITH zeros AS (
  SELECT
    card_id
  FROM
    `Elo.train`
  WHERE
    target = 0
),

count AS (
  SELECT
    merchant_id
    , COUNT(merchant_id) AS all_count
  FROM
    `Elo.historical_transactions`
  GROUP BY
    merchant_id
),


card AS (
  SELECT
    card_id
    , merchant_id
  FROM
    `Elo.historical_transactions`
)


SELECT
  card.card_id
  , AVG(CASE WHEN c.rate IS NOT NULL THEN c.rate ELSE 0 END) AS rate
FROM
  card
LEFT OUTER JOIN (
  SELECT
    b.merchant_id
    , count.all_count
    , count_
    , count_ / count.all_count AS rate
  FROM(
    SELECT
      a.merchant_id
      , COUNT(a.merchant_id) AS count_
    FROM
      `Elo.historical_transactions`  AS a
    LEFT OUTER JOIN
      zeros
    ON
      a.card_id = zeros.card_id
    WHERE
      zeros.card_id IS NOT NULL
    GROUP BY
      merchant_id
  ) AS b
  LEFT OUTER JOIN
    count
  ON
    b.merchant_id = count.merchant_id
) AS c
ON
  card.merchant_id = c.merchant_id
GROUP BY
  card.card_id
ORDER BY
  card_id
