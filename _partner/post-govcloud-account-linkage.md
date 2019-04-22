---
title: Connect GovCloud Commercial Account to GovCloud Asset Account
position: 12
description: Link a GovCloud account that receives the Detailed Billing Record with the GovCloud account that owns AWS assets.
type: post
endpoint: https://chapi.cloudhealthtech.com/api/v1/govcloud_linkages
parameters:
  - name: client_api_id
    required: yes
    content: String that specifies the unique customer API Key that CloudHealth generates. See [How to Get Client API ID](#partner_how-to-get-client-api-id)
  - name: JSON document
    required: yes
    content: Payload containing a single relationship between a GovCloud Commercial Account and a GovCloud Asset Account. See [Understand Format of GovCloud Linkage Payload](#partner_understand-format-of-govcloud-linkage-payload).
content_markdown: |-
  **GovCloud Commercial Account:** The proxy account that contains the costs for the account in the Detailed Billing Record.

  **GovCloud Asset Account:** The account that owns the AWS assets.

  The CloudHealth Platform validates the relationship between these two accounts as expressed by the JSON payload by using these considerations.
  * Both accounts are owned by the customer associated with the logged in user.
  * Neither account is in an existing GovCloud relation
  * The GovCloud Asset Account specified must have `is_govcloud` set to `true`, indicating that it is associated with a GovCloud region.
  * The GovCloud Commercial account is the opposite, must not be in the AWS GovCloud Region.

  If any of these validations fails, a list of errors is returned.

right_code_blocks:
  - code_block: |-
      curl -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -XPOST 'https://chapi.cloudhealthtech.com/api/v1/govcloud_linkages?
      client_api_id=<customer_api_id>' -d
      {
        "govcloud_acct_id": 1,
        "commercial_acct_id": 2
      }
    title: Request
    language: bash
  - code_block: |-
      '{
        "id": 8,
        "customer_id": XXXX,
        "govcloud_acct": 1,
        "commercial_acct": 2,
        "created_at": "2018-05-16T20:18:58Z",
        "updated_at": "2018-05-16T20:18:58Z"
      }'
    title: Response
    language: bash
---
