---
title: Get All Allowed Accounts
position: 10
description: Used in FlexOrgs only. Retrieves a list of accounts that belong to an organization and can be assigned to potential child organizations. Make a GET request to the parent organization of the organization you want to add accounts to.
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
