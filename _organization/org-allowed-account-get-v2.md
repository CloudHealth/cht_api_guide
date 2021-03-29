---
title: Get All Allowed Accounts
position: 10
description: Returns accounts that belong to an organization and that can be assigned to potential child organizations. So, you would make a GET call on the organization's parent organization that you want to add accounts to.
type: get
endpoint: https://chapi.cloudhealthtech.com/v2/organizations/:org_id/available_accounts
parameters:
  - name: type
    required: yes
    content: Specify the cloud account type as `aws_accounts` for AWS, `azure_subscriptions` for Azure, `gcp_compute_projects` for GCP, `data_center_accounts` for Data Center, or `vmware_csp_organizations` for VMware Cloud.
right_code_blocks:
  - code_block: |-
      {
        "aws_accounts": [
          {
            "id": "656265534892",
            "name": "CloudHealth NG Dev",
            "owner_id": "foo",
            "account_type": "standalone",
            "authentication_type": "role",
            "status": "healthy",
            "tags": { "foo": "bar", "baz": "bang" }
          }
        ]
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d  
          'https://chapi.cloudhealthtech.com/v2/organizations/<org_id>/available_accounts?type=aws_accounts'
    title: Sample Request
    language: bash
---
