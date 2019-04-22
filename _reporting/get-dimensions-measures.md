---
title: Report Dimensions and Measures
type: get
description: Get dimensions and measures for a report so that you can build granular report queries
position: 7
endpoint: https://chapi.cloudhealthtech.com/olap_reports/:report-type/:report-id/new
parameters:
  - name:
    content:
content_markdown: |-
  You can build granular report queries by passing dimensions and measures into the query string. In order to build detailed queries, first discover which dimensions and measures are available at the endpoint for each report.

  Each report has a `/new` endpoint that returns the dimensions and measures available for that report.

right_code_blocks:
  - code_block: |-
      curl -H 'Authorization: Bearer <your_api_key>' -H 'Accept: application/json' 'https://chapi.cloudhealthtech.com/olap_reports/usage/instance/new'
    title: Request
    language: bash
  - code_block: |-
      {
        "dimensions": [
        {
          "label": "Owner Perspective",
          "name": "Groupset-998"
          "members": [
            {
              "label": "Joe",
              "name": "1392"
            },
            {
              "label": "Sue",
              "name": "1388"
            },
            {
              "label": "No Owner Found",
              "name": "1386"
            }
          ],
        },
        {
          "label": "Function Perspective",
          "name": "Groupset-999"
          "members": [
            {
                "label": "Zookeeper",
                "name": "27715"
            },
            {
                "label": "Databases",
                "name": "27716"
            },
            ...
          ],
        },
        {
          "label": "Availability Zones",
          "name": "AWS-Availaibility-Zones"
          "members": [
            {
                "label": "us-east-1a",
                "name": "us-east-1a"
            },
            {
                "label": "us-east-1b",
                "name": "us-east-1b"
            },
            {
                "label": "us-east-1d",
                "name": "us-east-1d"
            }
          ],
        },
        {
          "label": "Days",
          "name": "time"
          "members": [
            {
                "label": "2014-08-27",
                "name": "1"
            },
            {
                "label": "2014-08-28",
                "name": "2"
            },
            ...
          ],
        }
        ...
      ],
      "measures": [
        {
          "label": "# Instances",
          "name": "usage_quantity"
        },
        {
          "label": "Total Cost ($)",
            "name": "cost"
        },
        {
            "label": "Compute Cost ($)",
            "name": "ec2_cost_compute"
        },
        {
            "label": "Transfer Cost ($)",
            "name": "ec2_cost_transfer"
        },
        {
            "label": "# Reservations",
            "name": "count"
        },
        {
            "label": "On-Demand Cost ($)",
            "name": "ec2_cost_on_demand"
        },
        {
            "label": "# Instance Hours",
            "name": "instance_hours"
        }
      ]
      }
    title: Response
    language: json
---
