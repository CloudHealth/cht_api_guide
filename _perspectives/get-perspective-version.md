---
title: Get Perspective Version
type: example
description: Include the version of a Perspective in the response.
position: 8
right_code_blocks:
  - code_block: |-
      curl -s -H 'Authorization: Bearer <your_api_key>' -H 'Accept: application/json'
        "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>
        ?&include_version=true"
    title: Request
    language: bash
  - code_block: |-
      {
        "type": "Version",
        "list": [
          {
            "ref_id": 181,
            "val": 2
          }
        ]
      }
    title: Response
    language: bash
---
