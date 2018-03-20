---
title: Delete Perspective Schema
position: 8
description: Remove a specific Perspective from the CloudHealth Platform. You can perform a soft (default), forced, or hard deletion.
type: delete
endpoint: https://chapi.cloudhealthtech.com/v1/perspective_schemas/:perspective-id
parameters:
  - name: force
    required: no
    content: Boolean that specifies whether the current version of the perspective is returned in the response.
  - name: hard_delete
    required: no
    content: Boolean that defines whether the current version of the perspective is returned in the response.
content_markdown: |-
  There are three levels of Perspective deletion.
  #### Soft Delete
  With this option, the Perspective is deleted and archived. Dependencies of the Perspective such as Policies and Report Subscriptions are ignored in the CloudHealth Platform. You can resurrect the Perspective from the archive; however, you will need to recreate all dependencies.
  ```
  curl -s -H "Accept: application/json" -XDELETE "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>?api_key=<api_key>"
  ```

  #### Force Delete
  This option deletes the Perspective irrespective of whether any dependencies exist in Policies or Report Subscriptions.
  ```
  curl -s -H "Accept: application/json" -XDELETE "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>
    ?api_key=<api_key>
    &force=true"
  ```
  ##### Hard Delete
  With this option, the Perspective is deleted permanently. It is not archived.
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
