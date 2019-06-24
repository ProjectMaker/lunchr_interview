SELECT
  id,
  merchant_name AS name,
  updated_at,
  created_at,
  "card" AS source_type
FROM
  card_payments
UNION
SELECT
  id,
  resto_name AS name,
  updated_at,
  created_at,
  "resto" AS source_type
FROM
  resto_orders
UNION
SELECT
  id,
  company_name AS name,
  updated_at,
  created_at,
  "voucher" AS source_type
FROM
  meal_voucher_credits
