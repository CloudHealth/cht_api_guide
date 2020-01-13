---
title: Modify Existing Organization
position: 6
description: Modify an organization that already exists in the CloudHealth Platform.
type: put
endpoint: https://chapi.cloudhealthtech.com/v1/organizations/:org_id
parameters:
  - name: name
    required: no
    content: String that specifies the unique name of the organization.
  - name: description
    required: no
    content: String that specifies a description of the organization.
right_code_blocks:
  - code_block: |-
      {
        "description": "abc 123"
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "id":1,
        "name": "abc",
        "description": "abc 123",
        "idp_name": "abc",
        "aws_accounts":["123"],
        "azure_subscriptions":["abc1"],
        "gcp_compute_projects":["3456"],
        "data_center_accounts":["cvdg12"]
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request PUT -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        '{
          "description": "abc 123"
        }'
          'https://chapi.cloudhealthtech.com/v1/organizations/<org_id>'
    title: Sample Request
    language: bash
---
