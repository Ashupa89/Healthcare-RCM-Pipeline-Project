# Ingest claims via SFTP and push to S3
import boto3
import paramiko
import os

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    secret_name = os.environ['SFTP_SECRET_NAME']

    # Assume secret contains {"username": "...", "password": "..."}
    secrets_client = boto3.client('secretsmanager')
    secret = secrets_client.get_secret_value(SecretId=secret_name)
    credentials = eval(secret['SecretString'])

    transport = paramiko.Transport(('sftp.example.com', 22))
    transport.connect(username=credentials['username'], password=credentials['password'])
    sftp = paramiko.SFTPClient.from_transport(transport)

    with sftp.file('/claims/claims.csv', 'r') as f:
        s3.upload_fileobj(f, 'rcm-raw', 'claims/claims.csv')