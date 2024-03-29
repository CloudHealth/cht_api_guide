---
title: List of Queryable Reports
type: get
description: Retrieve a list of Standard OLAP reports that you can query.
position: 5
endpoint: https://chapi.cloudhealthtech.com/olap_reports
parameters:
  - name: org_id
    required: no
    content: String that specifies the ID of the organization in which this query should run. See [How to Get Organization ID](#organization_how-to-get-organization-id). If not specified, this parameter assumes the ID of your default organization.
content_markdown: |-
  The response to this query contains a list of endpoints that provide Standard CloudHealth reports of specific types. The following endpoints are returned.
  * `/cost`
  * `/custom`
  * `/performace`
  * `/usage`

  These endpoints are hierarchical. For example the `/cost` endpoint branches out into specific reports of that type

  | Branch | Report name in CloudHealth Platform |
  |---|---|
  | `history` | Cost History |
  | `current` | Current Cost |
  | `instance` | EC2 Instance Cost |

right_code_blocks:
  - code_block: |
      curl -H 'Authorization: Bearer <your_api_key>' -H 'Accept: application/json' 'https://chapi.cloudhealthtech.com/olap_reports'
    title: Basic Request
    language: bash
  - code_block: |-
      curl -H 'Authorization: Bearer <your_api_key>' -H 'Accept: application/json' https://chapi.cloudhealthtech.com/olap_reports' | python -m json.tool
    title: Pretty print results
    language: bash
  - code_block: |-
      {
        "links": {
          "cost": {
            "href": "https://chapi.cloudhealthtech.com/olap_reports/cost"
          },
          "custom": {
            "href": "https://chapi.cloudhealthtech.com/olap_reports/custom"
          },
          "performance": {
            "href": "https://chapi.cloudhealthtech.com/olap_reports/performance"
          },
          "usage": {
            "href": "https://chapi.cloudhealthtech.com/olap_reports/usage"
          }
        }
      }
    title: Response
    language: json
---
