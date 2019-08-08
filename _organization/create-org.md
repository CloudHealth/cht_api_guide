---
title: Create Organization
position: 4
description: Add a new organization to the CloudHealth Platform. 
type: post
endpoint: https://chapi.cloudhealthtech.com/v1/organizations
parameters:
  - name: name
    required: yes
    content: String that specifies the unique name of the new organization.
  - name: description
    required: no
    content: String that specifies a description of the organization.
right_code_blocks:
  - code_block: |-
      {
        "name": "abc",
        "Description": "abc desc"
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "id":1
        "name": "abc",
        "Description": "abc desc",
        "idp_name": "abc",
        "aws_accounts":[],
        "azure_subscriptions":[],
        "gcp_compute_projects":[],
        "data_center_accounts":[]
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request POST -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        '{
          "name": "abc",
          "Description": "abc desc"
        }'    
          'https://chapi.cloudhealthtech.com/v1/organizations'
    title: Sample Request
    language: bash
---
