---
title: Delete Perspective Schema
position: 8
description: Remove a specific Perspective from the CloudHealth Platform. You can perform a soft (default), forced, or hard deletion.
type: delete
endpoint: https://chapi.cloudhealthtech.com/v1/perspective_schemas/:perspective-id
parameters:
  - name: force
    required: no
    content: Boolean that specifies whether the Force Delete option is exercised. See [Force Delete](#force-delete).
  - name: hard_delete
    required: no
    content: Boolean that specifies whether the Hard Delete option is exercised. See [Hard Delete](#hard-delete).
content_markdown: |-
  There are three levels of Perspective deletion.
  #### Soft Delete (default)
  This option deletes the Perspective and archives it only if there are no Perspective dependencies such as Policies and Report Subscriptions. You can restore the deleted Perspective.

  ```
  curl -s -H "Accept: application/json" -XDELETE "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>?api_key=<api_key>"
  ```

  #### Force Delete
  This option deletes and archives the Perspective irrespective of whether any dependencies exist in Policies or Report Subscriptions. You can restore the deleted Perspective, but you will need to recreate the Policies and Report Subscriptions that depended on the Perspective.

  ```
  curl -s -H "Accept: application/json" -XDELETE "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>
    ?api_key=<api_key>
    &force=true"
  ```
  ##### Hard Delete
  This option deletes the Perspective without archiving it. You cannot restore a Perspective that was deleted using this option.

  ```
  curl -s -H "Accept: application/json" -XDELETE "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective id>
    ?api_key=<api_key>
    &force=true
    &hard_delete=true"
  ```
right_code_blocks:
  - code_block: |-
      curl -s -H "Accept: application/json" -XDELETE "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>
        ?api_key=<api_key>"
    title: Delete
    language: bash
---
