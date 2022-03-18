from boto3 import Session

# sess = Session(aws_access_key_id='xxxxxxxxxxxx',
#                aws_secret_access_key='xxxxxxxxxxxxxxxxx',
#               region_name="us-east-1")
sess = Session()

# Use Amazon S3
s3 = sess.resource('s3')

# Print out all bucket names
for bucket in s3.buckets.all():
    print(bucket.name)