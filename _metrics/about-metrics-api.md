---
title: Introduction to Metrics API
position: 1
description: An introduction to the Metrics API and its limitations.
parameters:
  - name:
    content:
content_markdown: |-
  The Metrics API allows REST-based access to performance metrics, such as CPU, Memory, and Disk for AWS assets.

  The Metrics API allows you to read and write various performance metrics at this endpoint.
  ```
  https://chapi.cloudhealthtech.com/metrics/v1
  ```
  Once you have uploaded metrics, you have improved insight into the health and performance of your cloud environment. In addition, the CloudHealth Platform is able to generate better rightsizing recommendations based on these metrics.

  #### Limitations
  - You can only post CPU, memory, and file system metrics.
  - You can only post up to 8 days of historical metrics data.
  - Metrics must have an hourly resolution.
  - An active AWS Instance associated with the metrics must already be present and active in the CloudHealth Platform and not be Chef-managed.
  - Metric retrieval is for individual assets only, that is, for AWS EC2 Instances or file systems of AWS EC2 Instances.
  - The payload can contain a max of 1000 data points. If there are more than 1000 data points, the entire request is rejected with a `422` response.
  - When posting to file systems, the associated instance must be present and active. However, if a file system object does not currently exist, a new one is automatically created and linked to the instance.
---
