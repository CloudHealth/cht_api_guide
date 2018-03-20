---
title: Search for Assets
type: get
description: Build a search query that retrieves assets that match specific criteria.
endpoint: https://chapi.cloudhealthtech.com/api/search.json
position: 4
parameters:
  - name: name
    content: String that specifies the type asset object to query, for example, AWSInstance
    required: yes
  - name: query
    required: yes
    content: Criteria for finding assets of a particular asset object type. Criteria are specified as `query=[field value][operator][value]`. For example, `query=name='MyAccount'+and+is_private=0`
  - name: include
    required: no
    content: String that specifies the name of a related asset object to include when returning a response.
  - name: api_version
    required: no
    content: Integer that specifies the API version to use. Possible values are `1` (default) and `2`. Version 1 queries only return assets are are active. Version 2 queries return both active and inactive assets.
    sub-fields:
      - name: page
        required: no
        content: Only available when `api_version=2`. Integer that specifies the page to display when results run over multiple pages. Default value is `1`.
      - name: per_page
        required: no
        content: Only available when `api_version=2`. Integer that specifies the number of assets to return per page. Default value is `100` and maximum value is `1000`.
      - name: is_active
        required: no
        content: Only available when `api_version=2`. Specify that only active assets should be returned by setting this parameter to `1`.
content_markdown: |-
  See [Asset Query Examples](#assetasset-query-examples).
right_code_blocks:
  - code_block: |
      curl "https://chapi.cloudhealthtech.com/api/search.json?
        api_key=<your api key>
        &name=AwsAccount
        &query=name='MyAccount'+and+is_private=0"
    title: Request
    language: bash
---
