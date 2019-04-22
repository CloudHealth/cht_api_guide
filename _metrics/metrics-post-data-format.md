---
title: Understand Format of Metrics Payload
description: Learn how to format the payload for uploading metric to the CloudHealth Platform.
position: 3
parameters:
  - name:
    content:
content_markdown: |-
  Familiarize yourself with the format of the payload that you can post through the Metrics API.

  You can send metrics as a collection of datasets. Each dataset describes a single asset type, either _instance_ or _file system_ and consists of these components.
  * a metadata header describing the data being sent
  * an array of values that represent the actual metrics data

  One or more datasets are bound up in a hash rooted with the metrics element.
  ```
  "metrics": {
    "datasets": []
  }
  ```

  Here's an example of the payload.
  ```
  {
    "metrics": {
      "datasets": [
        {
          "metadata": {
            "assetType": "aws:ec2:instance",
            "granularity": "hour",
            "keys": [
              "assetId",
              "timestamp",
              "memory:free:bytes.avg",
              "memory:free:bytes.max",
              "memory:free:bytes.min"
              "memory:size:bytes.avg",
              "memory:size:bytes.max",
              "memory:size:bytes.min"
              "memory:used:percent.avg",
              "memory:used:percent.max",
              "memory:used:percent.min"
            ]
          },
          "values": [
            [
              "us-east-1:12345678:i-99999999",
              "2015-06-03T01:00:00+00:00",
              53687391300,
              107374182400,
              26843545600,
              322122547200,
              322122547200,
              322122547200,
              16.67,
              33.33,
              8.33
            ],
            [
              "us-east-1:12345678:i-88888888",
              "2015-06-03T02:00:00+00:00",
              53687391300,
              107374182400,
              26843545600,
              322122547200,
              322122547200,
              322122547200,
              16.67,
              33.33,
              8.33
            ]
          ]
        }
      ]
    }
  }
  ```

  Let's take a look at the **metadata** array, which describes the data you are sending. It consists of these components:
  * an asset type
  * the granularity of the included data
  * an array of keys that describes the `type` of each element in the values array

  ```
  "metadata": {
    "assetType": 'aws:ec2:instance',
    "granularity": 'hour',
    "keys" [
      "assetId",
      "timestamp",
      "memory:free:bytes.avg",
      "memory:free:bytes.max",
      ...
    ]
  }
  ```

  The metadata array contains the `assetType`, `granularity`, and `keys` fields, which can take specific values.

  **Field:** `assetType`

    | Supported Values      | `keys` Field              |
    | --------------------- | ------------------------- |
    | `aws:ec2:instance`    | `cpu:used:percent.avg`    |
    |                       | `cpu:used:percent.min`    |
    |                       | `cpu:used:percent.max`    |
    |                       | `memory:free:bytes.avg`   |
    |                       | `memory:free:bytes.min`   |
    |                       | `memory:free:bytes.max`   |
    |                       | `memory:size:bytes.avg`   |
    |                       | `memory:size:bytes.min`   |
    |                       | `memory:size:bytes.max`   |
    |                       | `memory:used:percent.avg` |
    |                       | `memory:used:percent.min` |
    |                       | `memory:used:percent.max` |
    |                       | `assetId`                 |
    |                       | `timestamp`               |
    | `aws:ec2:instance:fs` | `fs:size:bytes.avg`       |
    |                       | `fs:size:bytes.min`       |
    |                       | `fs:size:bytes.max`       |
    |                       | `fs:used:bytes.avg`       |
    |                       | `fs:used:bytes.min`       |
    |                       | `fs:used:bytes.max`       |
    |                       | `assetId`                 |
    |                       | `timestamp`               |

  **Field:** `granularity`
  **Supported Values:** `hour`

  The **values** array has an entry for each series of metrics you want to post. Each entry is itself an array of metrics corresponding to the elements in the `keys` array, that is, in the same order and of the same length.

  ![](images/metadata-values-mapping.png)

  Each entry array consists of these components.
  * Instance specification using a compact form of the AWS ARN format (`<region>:<account-number>:<AWS-instance-ID>`) or file system specification using a compact form of the AWS ARN format (`<region>:<account-number>:<AWS-instance-ID>:<file-system-mount-point>`)
  * UTC-based timestamp that is on the hourly boundary specified in ISO-8601 format

  An entry for instance might look like this.
  ```
  "values": [
    [ "us-east-1:12345678:i-a99a99a9", "2015-06-03T00:01:00+00:00", 200, 400, ...],
    [ "us-east-1:12345678:i-a99a99a9", "2015-06-03T00:02:00+00:00", 100, 300, ...],
  ]
  ```

  While an entry for a file system might look like this.
  ```
  "values": [
    [ "us-east-1:12345678:i-a99a99a9:/opt", "2015-06-03T00:01:00+00:00", 200, 400, ...],
    [ "us-east-1:12345678:i-a99a99a9:/opt", "2015-06-03T00:02:00+00:00", 100, 300, ...],
  ]
  ```

  Once you build the payload, you can use a cURL command to post it to the `/metrics/v1` endpoint.
left_code_blocks:
  - code_block: |-
      curl -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -XPOST "https://chapi.cloudhealthtech.com/metrics/v1" -d '{"metrics":{"datasets":[{"metadata":{"assetType":"aws:ec2:instance","granularity":"hour","keys":["assetId","timestamp","memory:usedPercent.avg","memory:usedPercent.max","memory:usedPercent.min"]},"values":[["us-east-1:12345678:i-99999999","2015-06-03T01:00:00+00:00",100.0,200.0,50.0],["us-east-1:12345678:i-88888888","2015-06-03T02:00:00+00:00",25.5,45.2,15.0]]}]}}'
    title: Metrics Post
    language: bash
---
