#!/usr/bin/env bash
set +x #xtrace
set +v #verbose
set -e #errexit
set -u #nounset

region='us-east-1'
export AWS_DEFAULT_REGION=$region
export AWS_REGION=$region

hosted_zone_domain='mkoelle.com'
hosted_zone_export_key='mkoelle-com-id'
dev_hosted_zone_domain="shadow.${hosted_zone_domain}"
dev_hosted_zone_export_key="shadow-${hosted_zone_export_key}"

set -x

hosted_zone_id=$(aws cloudformation list-exports --query "Exports[?Name=='${hosted_zone_export_key}'].Value" --output text)
dev_hosted_zone_id=$(aws cloudformation list-exports --query "Exports[?Name=='${dev_hosted_zone_export_key}'].Value" --output text)

aws cloudformation deploy \
  --region ${region} \
  --template-file cfn/infra.yaml \
  --stack-name pawmaster-com-website \
  --parameter-overrides \
    HostedZoneId=${dev_hosted_zone_id} \
    HostedZoneDomain=${dev_hosted_zone_domain} \
  --tags \
      pawmaster:team=pawmaster \
      pawmaster:product=pawmaster.com \
      pawmaster:stage=dev \
      pawmaster:createdBy=${USER}