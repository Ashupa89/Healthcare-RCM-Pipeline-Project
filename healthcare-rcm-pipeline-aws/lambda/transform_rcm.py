# Transform and enrich claims + payments data using Pandas
import boto3
import pandas as pd
from io import BytesIO

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    claims_obj = s3.get_object(Bucket='rcm-raw', Key='claims/claims.csv')
    payments_obj = s3.get_object(Bucket='rcm-raw', Key='payments/payments.csv')

    df_claims = pd.read_csv(claims_obj['Body'])
    df_payments = pd.read_csv(payments_obj['Body'])

    df = df_claims.merge(df_payments, on='claim_id', how='left')
    df['is_paid'] = df['payment_amount'] > 0

    out_buffer = BytesIO()
    df.to_parquet(out_buffer, index=False)

    s3.put_object(
        Bucket='rcm-gold',
        Key='rcm_cleaned/rcm_data.parquet',
        Body=out_buffer.getvalue()
    )