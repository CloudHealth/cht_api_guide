---
title: Retrieve All Perspectives
position: 4
description: Retrieve a list of all Perspectives you have created in the CloudHealth Platform.
content_markdown: |-
  The response contains the list in the form of a hash that includes the Perspective ID, Perspective name, and a flag field that indicates whether the Perspective is active.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/perspective_schemas
parameters:
  - name: active_only
    required: no
    content: Boolean that specifies whether only active Perspectives are returned in the response.
  - name: org_id
    required: no
    content: String that specifies the ID of the organization in which this query should run. See [How to Get Organization ID](#organization_how-to-get-organization-id). If not specified, this parameter assumes the ID of your default organization.
right_code_blocks:
  - code_block: |-
      curl -s -H "Accept: application/json" "https://chapi.cloudhealthtech.com/v1/perspective_schemas?api_key=<api key>"
    title: Request
    language: bash
  - code_block: |-
      {
        "206159639971": { "name": "DDE Test", "active": false  },
        "206159351171": { "name": "Environment ", "active": true  },
        "206159659286": { "name": "Environment-tmp", "active": false  },
        "206159657643": { "name": "Efe Test", "active": false  },
        "206159708697": { "name": "Sidd test", "active": true  },
        "181": { "name": "Function", "active": true  },
        "650": { "name": "Finance Costs", "active": true  }
      }
    title: Response
    language: bash
---
