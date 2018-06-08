---
title: Data for Standard Report
type: get
description: Retrieve the data for a specific Standard report.
position: 5
endpoint: https://chapi.cloudhealthtech.com/olap_reports/:report-type/:report-id
parameters:
  - name: dimensions
    required: no
    content: Array that specifies the members to use for Categorization and the X-Axis.
  - name: measures
    required: no
    content: Array that specifies the Y-axis measures to use for the report.
  - name: interval
    required: no
    content: String that specifies the granularity of report data.
  - name: filters
    required: no
    content: Array that specifies the filters to use for constraining report data.
content_markdown: |-
  Retrieving the data for a specific Standard report, such as `/cost/history`, `/cost/current`, or `/usage/instance` involves the following steps.

  1. Get the endpoints for all types of Standard reports.

     `curl -H "Accept: application/json" "https://chapi.cloudhealthtech.com/olap_reports?api_key=<your_api_key>"`

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

  2. Query the endpoint for the type of report from this response and get a list of all reports of that type. This example request queries the `/usage` endpoint to get a list of all Standard Usage Reports.

     `curl -H "Accept: application/json" "https://chapi.cloudhealthtech.com/olap_reports/usage?api_key=<your_api_key>"`

     This query returns the following response, which has been truncated here for simplification.

     **Note:** Only those reports that have `/olap_reports` in their endpoint are accessible through the API.

     ```
     {  
     "links":{
        [...]
        "usage/instance":{  
          "href":"https://chapi.cloudhealthtech.com/olap_reports/usage/instance"
        },
        "usage/volume":{  
          "href":"https://chapi.cloudhealthtech.com/olap_reports/volume"
        },
        [...]
      }
     }
     ```
  3. Query the endpoint for the specific report to get its data. This example request queries the `/usage/instance` endpoint to get the data for the EC2 Instance Usage report.

      `curl -H "Accept: application/json" "https://chapi.cloudhealthtech.com/olap_reports/usage/instance?api_key=<your_api_key>"`

      This query returns the following response, which has been truncated here for simplification.

      ```
      {
        "report":"Instance Usage",
        "dimensions":[
          {
            "time":[...]
          },
          {
            "EC2-Reservation-Execution-Mode":[...]
          }
        ],
        "measures":[
          {
            "name":"usage_quantity",
            "label":"# Instances"
          }
        ],
        "interval":"daily",
        "filters":[...],
        "updated_at":"2018-02-05T03:08:40+00:00",
        "data":[
          [[100, 40, 60], [60, 20, 40], [40, 20, 20], ...],
          [...],
        ],
        "status":"ok"
      }
      ```

      Depending on which Standard Report you query, the response might vary in structure. However, all responses have common elements. See [Understand Report Data Format](#Reportingreport-data-format).
      {: .success}
right_code_blocks:
  - code_block: |-
      curl -H "Accept: application/json" "https://chapi.cloudhealthtech.com/olap_reports/usage/instance?api_key=<your_api_key>"`
    title: Request
    language: bash
  - code_block: |-
      {
        "report":"Instance Usage",
        "dimensions":[
          {
            "time":[...]
          },
          {
            "EC2-Reservation-Execution-Mode":[...]
          }
        ],
        "measures":[
          {
            "name":"usage_quantity",
            "label":"# Instances"
          }
        ],
        "interval":"daily",
        "filters":[...],
        "updated_at":"2018-02-05T03:08:40+00:00",
        "data":[
          [[100, 40, 60],
          [60, 20, 40],
          [40, 20, 20], ...],
          [...],
        ],
        "status":"ok"
      }
    title: Response
    language: json
---
