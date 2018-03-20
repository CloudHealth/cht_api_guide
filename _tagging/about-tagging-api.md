---
title: Introduction to Tagging API
position: 1
description: An introduction to the Tagging API and its limitations.
parameters:
  - name:
    content:
content_markdown: |-
  The Tagging API allows you to add tags (key-value pairs) to objects in the CloudHealth Platform, including taggable AWS assets, AWS accounts, taggable Azure assets, and Data Center servers. These tags are completely independent of your cloud provider tags.

  When you tag objects using this API, the resources are only tagged in the CloudHealth Platform. The tags do not cascade down to your cloud provider (AWS, Azure, or Data Center). CloudHealth continues to pull tags from both your cloud provider.

  The Tagging API allows you to add tags at this endpoint.
  ```
  https://chapi.cloudhealthtech.com/v1/custom_tags
  ```

  #### Limitations
  - No more than 100 instances per request
  - No more than 100 tags per instance
  - Tag keys must be between 1 and 127 characters long
  - Tag values must be no longer than 255 characters long
  - Tag values must be scalar. Lists and objects are not allowed. Numbers will be converted to strings.
  - Tag value will be stripped of leading and trailing whitespace
---
