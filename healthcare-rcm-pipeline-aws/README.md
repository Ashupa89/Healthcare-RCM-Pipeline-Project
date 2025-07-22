# Healthcare RCM Serverless Pipeline (AWS)

## Overview
- Ingests claims & payments via Lambda from SFTP
- Transforms & enriches using Pandas in Lambda
- Stores cleaned data in S3 (Parquet)
- Query with Athena or visualize in QuickSight

## Deployment
1. `cd terraform && terraform init && terraform apply`
2. Zip `lambda/ingest_claims.py` and `transform_rcm.py` into `dist/`
3. Upload sample data to SFTP folder or mock S3 trigger
4. Query with Athena using SQL in `athena/`