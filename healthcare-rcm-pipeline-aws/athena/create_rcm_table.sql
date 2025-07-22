CREATE EXTERNAL TABLE rcm_data (
  claim_id string,
  patient_id string,
  provider_id string,
  diagnosis_code string,
  payment_amount double,
  payment_date string,
  is_paid boolean
)
STORED AS PARQUET
LOCATION 's3://rcm-gold/rcm_cleaned/';