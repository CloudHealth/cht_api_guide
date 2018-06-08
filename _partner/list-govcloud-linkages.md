---
title: List All GovCloud Linkages Owned by Current Customer
position: 13
description: Get all GovCloud linkages that are owned by the current customer.
type: get
endpoint: https://chapi.cloudhealthtech.com/api/v1/govcloud_linkages
parameters:
  - name: client_api_id
    required: yes
    content: String that specifies the unique customer API Key that CloudHealth generates. See [How to Get Client API ID](#partner_how-to-get-client-api-id).
right_code_blocks:
  - code_block: |-
      curl -H "Content-Type: application/json" 'https://chapi.cloudhealthtech.com/api/v1/govcloud_linkages?
      api_key=<your_api_key>"
      &client_api_id=<customer_api_id>
    title: Request
    language: bash
  - code_block: |-
      [
        {
          "id": 8,
          "customer_id": XXXX,
          "govcloud_acct": 1,
          "commercial_acct": 2,
          "created_at": "2018-05-16T20:18:58Z",
          "updated_at": "2018-05-16T20:18:58Z"
        },
        {
          "id": 17,
          "customer_id": YYYY,
          "govcloud_acct": 3,
          "commercial_acct": 6,
          "created_at": "2018-05-16T20:18:58Z",
          "updated_at": "2018-05-16T20:18:58Z"
        },
        {
          "id": 25,
          "customer_id": ZZZZ,
          "govcloud_acct": 5,
          "commercial_acct": 8,
          "created_at": "2018-05-16T20:18:58Z",
          "updated_at": "2018-05-16T20:18:58Z"
        }
      ]
    title: Response
    language: bash
---
