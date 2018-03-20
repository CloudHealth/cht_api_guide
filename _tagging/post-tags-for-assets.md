---
title: Update Tags for Single Asset
type: post
description: Add, remove, or update tags that are associated with an asset.
position: 3
endpoint: https://chapi.cloudhealthtech.com/v1/custom_tags
parameters:
  - name: JSON document
    required: yes
    content: Payload containing the tags that you want to post. See [How Tags are Processed](#tagginghow-tags-are-processed).
content_markdown: |-
  The response to the post request is JSON.
  * Each successful update is shown to the `updates` array in the response.
  * Each partial failure is returned with an indication of which object or tag failed. Where possible, a descriptive message is also provided.
  * If there is a mix of updates and errors, the HTTP response code will still be `200 OK`.
right_code_blocks:
  - code_block: |-
      curl -H "Accept: application/json" -H "Content-Type: application/json" -XPOST "https://chapi.cloudhealthtech.com/v1/custom_tags?
        api_key=<your_api_key>"
        -d '{
          "tag_groups":[
            {
              "asset_type": "AwsAccount",
              "ids": [90],
              "tags": [
                {
                  "key": "testtag1",
                  "value": null
                }
              ]
            }
          ]
        }'
    title: Post
    language: bash
  - code_block: |-
      {
        "updates": [
          {
            "asset_type": "AwsAccount",
            "asset_id": 12345,
            "tag_key": "owner",
            "tag_value": "Fred"
          },
          {
            "asset_type": "AwsAccount",
            "asset_id": 56789,
            "tag_key": "owner",
            "tag_value": "Fred"
          },
          {
            ...
          }
        ],
        "errors": [
          {
            "message": "Asset does not exist or user does not have access",
            "asset_type": "AwsRdsInstance",
            "asset_id": 206158446754
          }
        ]
      }
    title: Response
    language: json
---
