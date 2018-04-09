---
title: Understand Report Data Format
position: 2
description: Familiarize yourself with the format of the response that a Standard Report query returns.
parameters:
  - name:
    content:
content_markdown: |-
  When you query a Standard Report, the response you receive has the following general structure.

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

  Let's break down this response.
  - `report` is a string that contains the display name of the report (e.g., Instance Usage).
  - `dimensions` is an array that contains the available members for the X-axis and categorization (e.g., by Days categorized by Reservation Type).
  - `measures` is an array that contains the selected measures for the report (e.g. # Instances)
  - `interval` is a string that contains the granularity of the report (e.g., monthly, weekly, or hourly)
  - `filters` is an array that contains all the filters selected for the report
  - `data` is an array that contains the report data

  See how these fields match to elements of the Report interface in the CloudHealth Platform.

  ![](images/report-terms.png)

  Among these fields, the `data` field deserves some more explanation. The structure of this field depends on the structure and content of the `dimensions` field.

  Let's say that the `dimensions` field contains the following array.

  ```
  "dimensions": [
    {
      "Past-12-Months": [
        {"label": "Total", "name": "total"},
        {"label": "2013-10", "name": "2013-10"},
        {"label": "2013-11", "name": "2013-11"},
        ...
      ]
    },
    {
      "AWS-Service-Category": [
        {"label": "Total", "name": "total"},
        { "label": "EC2 - Compute", "name": "ec2_compute" },
        { "label": "EC2 - Transfer", "name": "ec2_transfer" },
        ...
      ]
    }
  ]
  ```

  Then the corresponding `data` field might contain the following array.

  ```
  "data": [
    [[100, 40, 60], [60, 20, 40], [40, 20, 20], ...],
    [[30, 20, 10], [20, 10, 10], [10, 0, nil], ...],
    [[70, 40, 30], [40, 20, 20], [30, 20, 10], ...],
  ]
  ```

  Each row in `data` corresponds to time periods in the first subarray inside `dimensions`.

  ![](images/dimension-data-rows.png)

  Let's only consider the first row in `data` and correlate it with the structure of `dimensions`.

  ```
  [[100, 40, 60], [60, 20, 40], [40, 20, 20], ...]
  ```

  Within this row is the data specific to the second subarray inside `dimensions`, namely `AWS-Service-Category`.

  ![](images/data-sub-rows.png)

  Putting it all together, each row in `data` combines one or more dimensions.

  ![](images/putting-it-together.png)

  If a cell contains `0`, there was data for the specified dimension member in the underlying data analyzed, but the aggregate total was `0`. If a cell contains `null`, there was no data for this dimension member in the underlying data analyzed.
  {:.info}
---
