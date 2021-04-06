---
title: Add Dynamic Group to Perspective
type: example
description: Add a dynamic group to an existing Perspective. You can exclude the `ref_id` field from the request. Alternately, if you include the `ref_id` field, specify an arbitrary numerical value for it.
position: 9
right_code_blocks:
  - code_block: |-
      curl -s -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -X PUT "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>" -d '{"schema":{"name": "<perspective_name>","rules": [{"type": "categorize","asset": "AwsS3Bucket","field": ["Active?"],"name": "Dynamic_group_name"}]}}''
    title: Request
    language: bash
---
