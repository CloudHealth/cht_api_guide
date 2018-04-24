---
title: Modify Existing Customer
position: 6
description: Modify a partner customer tenant that already exists in the CloudHealth Platform.
type: put
endpoint: https://chapi.cloudhealthtech.com/v1/customers/:customer_id
right_code_blocks:
  - code_block: |-
      {
        "name": "Acme Corporation",
        "classification": "managed_with_access"
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "id": XXXX,
        "name": "Acme Corporation",
        "classification": "managed_with_access",
        "billing_contact": "john.doe@acmecorp.com",
        "margin_percentage": 0.0,
        "created_at": "2016-09-15T13:10:47Z",
        "updated_at": "2016-09-15T16:46:34Z",
        "generated_external_id": "1a2b3c4d5e6f",
        "partner_billing_configuration": {
            "enabled": true,
            "folder": ""
        },
        "address": {
           "street1": "1 Main St",
           "street2": "",
           "city": "Springfield",
           "State": "MA",
           "zipcode": "01234",
           "Country": "US"
        },
        "_links": {
            "self": {
                "href": "/v1/customers/XXXX"
            }
        }
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request PUT -H 'Content-Type: application/json' -d
      '{
        "name": "Acme Corporation",
        "classification": "managed_with_access"
      }'
      "https://chapi.cloudhealthtech.com/v1/customers/<customer_id>?api_key=<your_api_key>"
    title: Sample Request
    language: bash
---
