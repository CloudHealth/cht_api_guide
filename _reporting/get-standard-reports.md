---
title: List Reports of Specific Type
type: get
description: Retrieve the list of available Standard OLAP reports of a specify type.
position: 6
endpoint: https://chapi.cloudhealthtech.com/olap_reports/:report-type
parameters:
  - name: org_id
    required: no
    content: String that specifies the ID of the organization in which this query should run. See [How to Get Organization ID](#organization_how-to-get-organization-id). If not specified, this parameter assumes the ID of your default organization.
content_markdown: |-
  Retrieving a list of all reports of a specific type, such as `/cost`, `/custom`, `/performance`, or `/usage` is a two-step process.

  1. Get the endpoints for all types of Standard reports.

     `curl -H 'Authorization: Bearer <your_api_key>' -H 'Accept: application/json' 'https://chapi.cloudhealthtech.com/olap_reports'`

     This query returns the following response.

     ```
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
     ```

  2. Query the endpoint for the type of report from this response and get a list of all reports of that type.

     `curl -H 'Authorization: Bearer <your_api_key>' -H 'Accept: application/json' 'https://chapi.cloudhealthtech.com/olap_reports/cost'`
right_code_blocks:
  - code_block: |-
      curl -H 'Authorization: Bearer <your_api_key>' -H 'Accept: application/json' 'https://chapi.cloudhealthtech.com/olap_reports'

      curl -H 'Authorization: Bearer <your_api_key>' -H 'Accept: application/json' 'https://chapi.cloudhealthtech.com/olap_reports/cost'`
    title: Request
    language: bash
  - code_block: |-
      {
        "links": {
            "amortized": {
                "href": "https://chapi.cloudhealthtech.com/olap_reports/cost/amortized"
            },
            "current": {
                "href": "https://chapi.cloudhealthtech.com/olap_reports/cost/current"
            },
            "history": {
                "href": "https://chapi.cloudhealthtech.com/olap_reports/cost/history"
            },
            "instance": {
                "href": "https://chapi.cloudhealthtech.com/olap_reports/cost/instance"
            },
            "rds": {
                "href": "https://chapi.cloudhealthtech.com/olap_reports/cost/rds"
            },
            "ri_amortization": {
                "href": "https://chapi.cloudhealthtech.com/olap_reports/cost/ri_amortization"
            },
            "s3": {
                "href": "https://chapi.cloudhealthtech.com/olap_reports/cost/s3"
            },
            "volume": {
                "href": "https://chapi.cloudhealthtech.com/olap_reports/cost/volume"
            }
        }
      }
    title: Response
    language: json
---
