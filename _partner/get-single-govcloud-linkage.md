---
title: Details of Single GovCloud Linkage
position: 15
description: Get details for a specific GovCloud linkage.
type: get
endpoint: https://chapi.cloudhealthtech.com/api/v1/govcloud_linkages/:id
parameters:
  - name: client_api_id
    required: yes
    content: String that specifies the unique customer API Key that CloudHealth generates. See [How to Get Client API ID](#partner_how-to-get-client-api-id).
right_code_blocks:
  - code_block: |-
      curl -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' 'https://chapi.cloudhealthtech.com/api/v1/govcloud_linkages/25?
      client_api_id=<customer_api_id>
    title: Request
    language: bash
  - code_block: |-
      {
          "id": 25,
          "customer_id": ZZZZ,
          "govcloud_acct": 5,
          "commercial_acct": 8,
          "created_at": "2018-05-16T20:18:58Z",
          "updated_at": "2018-05-16T20:18:58Z"
      }
    title: Response
    language: bash
---
