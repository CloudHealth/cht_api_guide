---
title: Delete Existing Organization
position: 7
description: Delete an organization from the CloudHealth Platform.
type: delete
endpoint: https://chapi.cloudhealthtech.com/v1/organizations/:org_id
right_code_blocks:
  - code_block: |-
      curl --request DELETE -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
          'https://chapi.cloudhealthtech.com/v1/organizations/<org_id>'
    title: Sample Request
    language: bash
---
