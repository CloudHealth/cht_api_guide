---
title: Error Codes
category: documentation
position: 4
description: Types of response codes that indicate the success or failure of a CloudHealth API request.
parameters:
  - name:
    content:
content_markdown: |-
  CloudHealth uses conventional HTTP response codes to indicate the success or failure of an API request. In general, codes in the `2xx` range indicate success, codes in the `4xx` range indicate an error that failed given the information provided, and codes in the rare `5xx` range indicate an error with CloudHealth's servers.

  | Code | Name | Description |
  | --- | --- | --- |
  | 200 | OK | Success |
  | 400 | Bad Request | Header missing |
  | 401 | Unauthorized | Currently logged out |
  | 403 | Forbidden | Bad API Key |
  | 404 | Not Found | Bad endpoint |
  | 422 | Unprocessable Entity | Input format error |
  | 429 | Too many requests | Exceeding post rate limit |
  | 500 | Internal Service Error | General error |
  | 503 | Service not available | Back end capped out |

  All errors return JSON in the following format:
left_code_blocks:
  - code_block: |-
      {
        "error": "error message here"
      }
    title: Error Response Structure
    language: json
---
