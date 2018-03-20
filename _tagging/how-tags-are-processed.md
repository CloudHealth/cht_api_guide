---
title: How Tags are Processed
position: 2
description: Understand the process through which CloudHealth updates tags.
parameters:
  - name:
    content:
content_markdown: |-
  You can use the Tagging API to add new tags as well update existing ones. For either operation, you pass a tagging payload with the API request. Here is an example of the payload structure.

  ```
  {
    "tag_groups": [
      {
        "asset_type": "AwsAccount",
        "ids": [12345, 56789],
        "tags": [{"key": "owner", "value": "Fred"}]
      },
      {
        "asset_type": "AwsInstance",
        "ids": [1511831925873],
        "tags": [{"key": "environment", "value": "Test"}, {"key": "owner", "value": "Mary"}]
      },
      {
        "asset_type": "AwsRdsInstance",
        "ids": [206158446754],
        "tags": [{"key": "environment", "value": "Production"}, {"key": "owner", "value": "Mary"}]
      }
    ]
  }
  ```

  - `asset_type` is an asset that you can tag in the CloudHealth Platform.
  - `ids` is a list of CloudHealth IDs
  - `tags` is a list of key-value tag pairs

  CloudHealth runs through the following process when it receives the payload. The entire payload is processed. If failures occur, they are identified and processing continues.

  ![](images/tagging-workflow.png)
---
