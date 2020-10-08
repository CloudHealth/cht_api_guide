---
title: Attributes of Single Asset
type: get
endpoint: https://chapi.cloudhealthtech.com/api/:asset
position: 3
description: Retrieve the attributes and related assets for a single asset object.
parameters:
  - name: org_id
    required: no
    content: String that specifies the ID of the organization in which this query should run. See [How to Get Organization ID](#organization_how-to-get-organization-id). If not specified, this parameter assumes the ID of your default organization.
content_markdown: |-
  The response to this query contains two arrays: `attributes` and `relations`.

  The first array, `attributes`, lists the primary attributes of the AWS, Azure, Data Center, or Google Cloud asset that you want to explore. For example, an AWS Instance has attributes such as Account ID, Instance ID, Public IP, and Private IP. The `attributes` array also includes the Perspective Groups to which the AWS Instance belongs.

  The `relations` array contains related assets. In the case of an AWS Instance, the `relations` array lists objects such as `AwsAccount`, `AWSInstanceType`, `AwsAvailabilityZone`, and `ChefNode` objects.
right_code_blocks:
  - code_block: |
      curl -H 'Authorization: Bearer <your_api_key>' 'https://chapi.cloudhealthtech.com/api/AwsInstance'
    title: Request
    language: bash
  - code_block: |-
      {
        "name":"AwsInstance",
        "attributes":[
          { "name":"id" },
          { "name":"instance_id" },
          { "name":"public_ip" },
          ...
          { "name":"usage_percentage_per_month" },
          ...
          {
            "name": "attr_group__XXXXX3562234",
            "perspective_name": "Environment"
          },
          {
            "name": "attr_group__XXXXX3562234",
            "perspective_name": "Owner"
          },
          ...
          {
            "name": "attr_group__XXXXX35623434",
            "perspective_name": "Team"
          }
        ],
        "relations":[
          {  
            "name": "account",
            "object_type": "AwsAccount",
            "has_many": false
          },
          {  
            "name": "instance_type",
            "object_type": "AwsInstanceType",
            "has_many": false
          },
          ...
          {  
            "name": "auto_scaling_group",
            "object_type": "AwsAutoScalingGroup",
            "has_many": false
          },
          ...
        ]
    title: Response
    language: json
---
