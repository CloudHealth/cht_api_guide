---
title: Rate Limits
position: 2
parameters:
  - name:
    content:
content_markdown: |-
  CloudHealth limits the rate at the user, namely API key, level.
  - A total of 60 POST requests are allowed per minute.
  - Read requests are not throttled.
  - A `429` HTTP status code is returned if the request is throttled. The client should be written to handle this response and retry with an exponential backoff.
  - Since a payload can contain up to 1000 data points, a single client can push 60,000 data points per minute.
---
