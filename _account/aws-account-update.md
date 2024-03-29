---
title: Update Existing AWS Account
position: 4
description: Update the attributes of an AWS Account that is already enabled in the CloudHealth Platform.
type: put
endpoint: https://chapi.cloudhealthtech.com/v1/aws_accounts/:id
parameters:
  - name: name
    required: yes
    content: String that specifies the unique display name of an AWS account.
  - name: authentication
    required: no
    content: JSON field that specifies how to authenticate with your AWS accounts. Use IAM Role (recommended) or IAM User (less secure) to authenticate.
    sub-fields:
      - name: protocol
        required: yes
        content: Authentication protocol. Specify `access_key` or `assume_role`
      - name: access_key
        required: yes, if `protocol == access_key`
        content: Access Key for IAM User
      - name: assume_role_arn
        required: yes, if `protocol == assume_role`
        content: Role ARN for IAM Role
      - name: assume_role_external_id
        required: yes, for IAM-Role-based authentication
        content: External ID generated by CloudHealth
  - name: billing
    required: no
    content: JSON field that specifies the location of the AWS Detailed Billing Record (DBR)
    sub-fields:
      - name: bucket
        required: yes
        content: Name of S3 bucket containing the DBR
  - name: cost_and_usage_report
    required: no
    content: JSON field that specifies the location of the AWS Cost and Usage Report (CUR).
    sub-fields:
      - name: bucket
        required: yes
        content: Name of S3 bucket containing the CUR
      - name: path
        required: no
        content: The path to the CUR report, including the prefix
  - name: cloudtrail
    required: no
    content: JSON field that specifies whether CloudHealth should collect CloudTrail Trails and the location of Trail files.
    sub-fields:
      - name: enabled
        required: yes
        content: Should CloudHealth collect CloudTrail trails? Default value is `False`
      - name: bucket
        required: yes
        content: Name of S3 bucket containing the files
      - name: prefix
        required: yes, if you have enabled prefixing in AWS
        content: Prefix of Trail files
  - name: cloudwatch
    required: no
    content: JSON field that specifies whether CloudHealth should collect CloudWatch data.
    sub-fields:
      - name: enabled
        required: yes
        content: Should CloudHealth collect AWS Config files? Default value is `True`
      - name: namespaces
        required: no
        content: String that specifies the namespaces from which CloudWatch data should be gathered. Value can be `CWAgent`, `System/Linux`, `System/Windows`, or a comma-separated list of two or more of these values. Default value is an empty string.
      - name: runtime
        required: no
        content: Number that specifies the frequency in hours at which CloudHealth should gather CloudWatch data. Default value is `1`. Value can be `1` or `24`.
  - name: tags
    required: no
    content: JSON field that specifies key-value pairs for tags. When you use this field, The API restricts queries to AWS accounts that are tagged with these key-value pairs.
    sub-fields:
      - name: key
        required: yes
        content: Tag key
      - name: value
        required: yes
        content: Tag value
  - name: hide_public_fields
    required: no
    content: Boolean field that specifies whether CloudHealth should store public DNS and IP. Default value is `True`
  - name: region
    required: no
    content: JSON field that specifies the type of AWS Account. Value can be `global` (default) or `govcloud`.
  - name: primary_aws_region
    required: no
    content: String that specifies which region should be used to validate the read-only IAM policy. Value can be `us-east-1` (default) or `eu-central-1` for global AWS accounts. GovCloud customers cannot modify their default AWS region, `us-gov-west-1`.
right_code_blocks:
  - code_block: |-
      {
        "name": "Production Engineering Account",
        "tags": [
        {
          "key": "Environment",
          "value": "production"
        },
        {
          "key": "Owner",
          "value": "Engineering"
        }
        ]
      }
    title: Sample Request Body
    language: json
  - code_block: |-
      curl -d '{"authentication":{"protocol":"assume_role","assume_role_arn":"arn:123","assume_role_external_id":"61a1XXXXXXXXXXXXXXXXXXXXX5d8c6"},"name":"Tools 123"}' -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -H 'Accept: application/json' --request PUT 'https://chapi.cloudhealthtech.com/v1/aws_accounts/<account_id>'
    title: Sample Request
    language: bash
---
