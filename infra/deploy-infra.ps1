
$region='us-east-1'
$env:AWS_DEFAULT_REGION=$region
$env:AWS_REGION=$region

$env:AWS_SECRET_ACCESS_KEY = "fYdFA47ZX4W0/1ql4JzvLAFHS0EGwvN1t7ey4xgC"
$env:AWS_ACCESS_KEY_ID = "AKIAVOV5RWKZN46N5Z76"

aws cloudformation deploy `
  --region ${region} `
  --template-file cfn/infra.yml `
  --stack-name pawmaster-com-website `
  --tags `
      pawmaster:team=pawmaster `
      pawmaster:product=pawmaster.com `
      pawmaster:stage=dev