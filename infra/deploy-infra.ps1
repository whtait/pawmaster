
$region='us-east-1'
$env:AWS_DEFAULT_REGION=$region
$env:AWS_REGION=$region

aws cloudformation deploy `
  --region ${region} `
  --template-file cfn/infra.yml `
  --stack-name pawmaster-com-website `
  --tags `
      pawmaster:team=pawmaster `
      pawmaster:product=pawmaster.com `
      pawmaster:stage=dev