---
title: Data for Custom Report
type: get
description: Retrieve the data for a custom Standard report.
position: 6
endpoint: https://chapi.cloudhealthtech.com/olap_reports/custom/:report-id
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
  Custom reports are saved versions of Standard Reports. Retrieving the data for a specific saved report involves the following steps.

  1. Get the ID of the custom report.

      In the CloudHealth Platform, from the left menu, click **Reports > Saved Reports**. Click the **View Report** icon next to the report you want to retrieve.

      The URL in your browser contains the ID of the selected report.
      ![](images/saved-report-id.png)

  2. Query the endpoint for the specific report to get its data.

      `curl -H 'Authorization: Bearer <your_api_key>' -H 'Accept: application/json' 'https://chapi.cloudhealthtech.com/olap_reports/custom/<Report-ID>'`

      This query returns a response similar to this truncated one.

      ```
      {
        "report":"Cost History",
        "dimensions":[
          {
            "time":[...]
          },
          {
            "AWS-Service-Category":[...]
          }
        ],
        "measures":[
          {
            "name":"cost",
            "label":"Cost ($)"
          }
        ],
        "interval":"weekly",
        "filters":[...],
        "updated_at":"2018-02-05T03:08:40+00:00",
        "data":[
          [[100, 40, 60], [60, 20, 40], [40, 20, 20], ...],
          [...],
        ],
        "status":"ok"
      }
      ```

      Depending on which saved report you query, the response might vary in structure. However, all responses have common elements. See [Understand Report Data Format](#reporting_understand-report-data-format).
      {: .success}

right_code_blocks:
  - code_block: |-
      curl -H 'Authorization: Bearer <your_api_key>' -H 'Accept: application/json' 'https://chapi.cloudhealthtech.com/olap_reports/custom/<Report-ID>'
    title: Request
    language: bash
  - code_block: |-
      {
        "report":"Cost History",
        "dimensions":[
          {
            "time":[...]
          },
          {
            "AWS-Service-Category":[...]
          }
        ],
        "measures":[
          {
            "name":"cost",
            "label":"Cost ($)"
          }
        ],
        "interval":"weekly",
        "filters":[...],
        "updated_at":"2018-02-05T03:08:40+00:00",
        "data":[
          [[100, 40, 60], [60, 20, 40], [40, 20, 20], ...],
          [...],
        ],
        "status":"ok"
      }
    title: Response
    language: json
---
