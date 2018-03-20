---
title: Attributes of Single Asset
type: get
endpoint: https://chapi.cloudhealthtech.com/api/:asset.json
position: 2
description: Retrieve the attributes and related assets for a single asset object.
parameters:
  - name:
    content:
content_markdown: |-
  The response to this query contains a list of attributes of the AWS, Azure, Data Center, or Google Cloud asset that you want to explore. The response also includes related asset objects.

  For example, an AWS Instance has attributes such as Account ID, Instance ID, Public IP, and Private IP. In addition, this asset is also related to other asset objects such as the `AWSInstanceType`, `AwsAvailabilityZone`, and `ChefNode` objects.
right_code_blocks:
  - code_block: |
      curl 'https://chapi.cloudhealthtech.com/api/AwsInstance.json?
        api_key=<your api key>'
    title: Request
    language: bash
  - code_block: |-
      {
        "name":"AwsInstance",
        "attributes":[
          { "name":"id" }, { "name":"instance_id" }, { "name":"public_dns" }, { "name":"public_ip" }, ... { "name":"usage_percentage_per_month" },
          ...
        ],
        "relations":[
          {  
             "name":"aws_availability_zone",
             "object_type":"AwsAvailabilityZone",
             "has_many":false
          },
          {  
             "name":"aws_instance_type",
             "object_type":"AwsInstanceType",
             "has_many":false
          },
          ...
          {  
             "name":"newrelic_server",
             "object_type":"NewrelicServer",
             "has_many":false
          },
          ...
        ]
    title: Response
    language: json
---
