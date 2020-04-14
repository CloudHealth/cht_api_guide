---
title: Modify Existing Organization
position: 6
description: Modify an existing organization that already exists in the CloudHealth Platform.
type: put
endpoint: https://chapi.cloudhealthtech.com/v2/organizations/:org_id
parameters:
  - name: name
    required: no
    content: String that specifies the unique name of the organization.
  - name: description
    required: no
    content: String that specifies a description of the organization.
  - name: parent_organization_id
    required: no
    content: String that specifies the ID of the parent organization. Applies only for organizations in FlexOrgs.
right_code_blocks:
  - code_block: |-
      {
        "description": "abc 123"
        "parent_organization_id": "24"
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "id":6116033432624,
        "parent_organization_id": "24",
        "name": "abc",
        "description": "abc 123",
        "idp_name": "abc",
        "flex_org": false,
        "default_organization": true,
        "assigned_users_count": 124,
        "num_aws_accounts": 118,
        "num_azure_subscriptions": 25,
        "num_gcp_compute_projects": 15,
        "num_data_center_accounts": 84,
        "num_vmware_csp_organizations": 1
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request PUT -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        '{
          "description": "abc 123"
          "parent_organization_id": "24"
        }'
          'https://chapi.cloudhealthtech.com/v2/organizations/<org_id>'
    title: Sample Request
    language: bash
---
