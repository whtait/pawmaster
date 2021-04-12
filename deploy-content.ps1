
  $region='us-east-1'
  $env:AWS_DEFAULT_REGION=$region
  $env:AWS_REGION=$region

$s3_bucket_key='pawmaster-com-website-content-bucket'

$bucket=(aws cloudformation list-exports --query "Exports[?Name=='${s3_bucket_key}'].Value" --output text)

aws s3 sync src s3://${bucket}
