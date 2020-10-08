---
title: Upload Metrics for Single Asset
type: post
description: Post metrics for an individual asset, including historical metrics data.
position: 5
endpoint: https://chapi.cloudhealthtech.com/metrics/v1
parameters:
  - name: JSON document
    required: yes
    content: Payload containing the metrics that you want to post. See [Understand Format of Metrics Payload](#metrics_understand-format-of-metrics-payload).
  - name: dryrun
    required: no
    content: Test a POST operation without triggering a database change. Specified as `true` or `false` (default).
  - name: org_id
    required: no
    content: String that specifies the ID of the organization in which this query should run. See [How to Get Organization ID](#organization_how-to-get-organization-id). If not specified, this parameter assumes the ID of your default organization.
content_markdown: |-
  You can only post up to 8 days of historical metrics data.
  {:.warning}

  The format of the response payload is similar to this one.
  ```
  "succeeded": <The total number of rows that were successfully processed.>,
  "failed": <The total number of rows that were rejected.>,
  "errors": [
    "<A textual description of all errors that prevented the entire payload or an entire dataset from being processed.>"
  ]

  # Datasets provide details of failures at the row level within each dataset.
  "datasets": [
  {
    "succeeded": <Count of all rows in this dataset that were successfully added to the system.>,
    "errors": [
        "<Textual representation of any errors that prevented all data in this dataset from being processed.>"
    ],
    "failures": [
      {
        "error": "<Textual representation of any parsing errors that prevented a single row of data from being accepted.>"
        "row:" <The original row data that was passed in>
      }
    ]
  }
  ```

  | Response code | Meaning                                                            |
  | ------------- | ------------------------------------------------------------------ |
  | 200           | Success / Partial failure                                          |
  | 400           | No data was processed. Possibly malformed JSON document.           |
  | 429           | Request was throttled                                              |
  | 500           | Error with CloudHealth servers. Do not resend request immediately. |

right_code_blocks:
  - code_block: |-
      curl -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -XPOST "https://chapi.cloudhealthtech.com/metrics/v1" -d '{"metrics":{"datasets":[{"metadata":{"assetType":"aws:ec2:instance","granularity":"hour","keys":["assetId","timestamp","memory:usedPercent.avg","memory:usedPercent.max","memory:usedPercent.min"]},"values":[["us-east-1:12345678:i-99999999","2015-06-03T01:00:00+00:00",100.0,200.0,50.0],["us-east-1:12345678:i-88888888","2015-06-03T02:00:00+00:00",25.5,45.2,15.0]]}]}}'
    title: Post
    language: bash
  - code_block: |-
      {
        succeeded: 198,
        failed:    2,
        errors:    0,
        datasets:  [
          {
            "succeeeded": 100,
            "errors": [],
            "failures": []
          },
          {
            "succeeeded": 98,
            "errors": [],
            "failures": [
            {
              "error": "Number of values (6) must equal number of keys (5).",
              "row": [
                "us-east-1:12345678:i-99999999",
                "2015-06-03T02:00:00+00:00",
                100,
                75,
                50,
                111
              ]
            },
            {
              "error": "Percentage value (101) is greater than 100.",
              "row": [
                "us-east-1:12345678:i-88888888",
                "2015-06-03T03:00:00+00:00",
                101,
                75,
                50
              ]
            },
          ]
        },
        ]
      }
    title: Response
    language: json
---
