---
title: Metrics for Single Asset
type: get
description: Retrieve CPU, memory, and performance metrics for a specific asset
position: 4
endpoint: https://chapi.cloudhealthtech.com/v1/metrics
parameters:
  - name: asset
    required: yes
    content: String that specifies the AWS ARN that identifies the asset. The format is `arn:aws:ec2:<region>:<owner-id>:instance/<AWS-instance-ID>`. For example, `arn:aws:ec2:us-east-1:123456789012:instance/i-01a1234b56cdef7g8`.
  - name: granularity
    required: no
    content: String that specifies the resolution at which data should be returned. Possible values are `hour` (default), `day`, `week`, and `month`.
  - name: from
    required: no
    content: Date in `YYYY-MM-DD` format that specifies the start date from which you want to see metrics for the asset. You can use this parameter in conjunction with the `to` parameter to specify a custom date range for metrics retrieval.
  - name: to
    required: no
    content: Date in `YYYY-MM-DD` format that specifies the end date up to which you want to see metrics for the asset. You can use this parameter in conjunction with the `from` parameter to specify a custom date range for metrics retrieval.
  - name: time_range
    required: no
    content: String that specifies the time range limit to use when returning data. Possible values are `yesterday` (default), `mtd`, `last_month`, `last_3_months`, `last_6_months`, `last_12_months`, `wtd`, `last_week`, `last_2_weeks`, `last_4_weeks`, `last_52_weeks`, `today`, `yesterday`, `last_2_days`, `last_7_days`, `last_14_days`, and `last_31_days`
  - name: page
    required: no
    content: Integer that specifies the page to display when results run over multiple pages. Default value is `1`.
  - name: per_page
    required: no
    content: Integer between `1` and `500` that specifies the number of assets to return per page. Default value is `100` and maximum value is `1000`.
content_markdown: |-
  By default, the request returns hourly sets of metric points for the previous day. If there are more than 100 data value sets, a next link to the next page of value sets is also returned

  The response format is not wrapped in the `metrics` object. The response also contains a `next` link that can be followed to retrieve the next 100 metrics. The `next` attribute is `null` if there are no more records to retrieve.

  #### `time_range` and `granularity` Considerations
  Ensure that the value of the `time_range` parameter is large enough to encompass the requested `granularity`. For example, asking for `yesterday`'s data at a `monthly` resolution returns no rows, not an error. Requesting `yesterday`'s data with a granularity of `day` returns one row.

  In addition, rollups are calculated daily. You will not receive `today`'s data at any `granularity` other than `hourly`, which is the default value.
right_code_blocks:
  - code_block: |-
      curl 'https://chapi.cloudhealthtech.com/metrics/v1/?
        &asset=arn:aws:ec2:<region>:<owner-id>:instance/<AWS-instance-ID>'
        -H 'Authorization: Bearer <your_api_key>'
    title: Request
    language: bash
  - code_block: |-
      {
        "datasets": [
          "metadata" : {
            "assetType" : "aws:ec2:instance",
            "granularity" : "hour",
            "keys" : [
              "assetId",
              "timestamp",
              "cpu:used:percent.avg",
              "cpu:used:percent.max",
              "cpu:used:percent.min",
              "memory:free:bytes.avg",
              "memory:free:bytes.max",
              "memory:free:bytes.min",
              "memory:used:percent.avg",
              "memory:used:percent.max",
              "memory:used:percent.min"
            ]
          },
          "values" : [
            [ "us-east-1:12345678:i-99999999", "2017-10-22T05:00:00Z", 76, 99, 51, null, null, null, 22.5, 52.2, 18.1 ],
            [ "us-east-1:12345678:i-99999999", "2017-10-22T06:00:00Z", 91, 99, 81, null, null, null, 25.2, 53, 19.7 ]
          ]
        ]
      }
    title: Response
    language: json
---
