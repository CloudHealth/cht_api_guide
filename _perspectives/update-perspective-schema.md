---
title: Update Perspective Schema
position: 7
description: Modify a Perspective based on rules posted through a schema.
type: put
endpoint: https://chapi.cloudhealthtech.com/v1/perspective_schemas/:perspective-id
parameters:
  - name: check_version
    required: no
    content: Number that specifies the version of the Perspective schema that should be updated.
  - name: include_version
    required: no
    content: Boolean that defines whether the current version of the perspective is returned in the response.

content_markdown: |-
  If the schema contains references to Groups that do no exist in the Perspective, the PUT operation creates those Groups in the Perspective.
  {:.warning}

  You can specify both `to` and `from` fields in rules that reference target Groups. The `from` field is optional. When it is not present, the `Other (Assets Not Allocated)` group is considered to be the `from` Group.

  When you create a group-to-group rule, the update/create calls verify that the source group already has at least one rule higher in the rule that targets it.

  #### How to Avoid Conflicts during Concurrent Updates
  Use the `check_version` parameter to ensure that a concurrent update is not overwritten.
  ```
  curl -s -H 'Content-Type: application/json' -XPUT "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>?api_key=<api_key>&check_version=3"
  ```

  If the Perspective was updated, and therefore version-incremented, since the last GET operation, the update request returns a `400` error.
right_code_blocks:
  - code_block: |-
      curl -s -H 'Content-Type: application/json' -XPUT "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>
        ?api_key=<api_key>" -d '{"schema":<schema JSON>}'
    title: Update
    language: bash
---
