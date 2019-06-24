SELECT
  id AS indentifier,
  merchant_name AS name,
  updated_at,
  created_at,
  "card" AS type
FROM
  card_payments
UNION
SELECT
  id AS identifier,
  resto_name AS name,
  updated_at,
  created_at,
  "resto" AS type
FROM
  resto_orders
UNION
SELECT
  id AS identifier,
  company_name AS name,
  updated_at,
  created_at,
  "voucher" AS type
FROM
  meal_voucher_credits
