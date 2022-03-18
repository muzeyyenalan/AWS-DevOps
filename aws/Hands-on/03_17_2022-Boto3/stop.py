import boto3
ec2 = boto3.resource('ec2')
ec2.Instance("i-0f9419b377a79d5b5").stop()