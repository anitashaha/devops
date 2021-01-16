import boto3
ec2 = boto3.resource('ec2')
# create a new EC2 instance
instances = ec2.create_instances(
     ImageId='ami-0be2609ba883822ec',
     MinCount=1,
     MaxCount=2,
     InstanceType='t2.micro',
     KeyName='dev2020'
 )