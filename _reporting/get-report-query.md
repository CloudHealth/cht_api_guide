---
title: Get Query for a Report
type: example
description: Retrieve the query string and parameters that produce a Standard or Custom OLAP report.
position: 8
parameters:
  - name:
    content:
content_markdown: |-
  Each CloudHealth report is produced by a combination of parameters that together compose a query string.
  You can retrieve the query string that produces a Standard or Custom report.

  Because the response is JSON, meta characters are Unicode encoded.
  {:.info}

right_code_blocks:
  - code_block: |-
      curl -v -H 'Accept: application/json' 'https://chapi.cloudhealthtech.com/olap_reports/custom/{report-id}?get_query=true&api_key=<your_api_key>'
    title: Request
    language: bash
  - code_block: |-
      {
        "query":"report=My Saved Report?dimensions[]=AWS-Account&dimensions[]=AWS-Service-Category&measures[]=cost&measures[]=cost_recurring&interval=monthly&filters[]=time:select:-1"
      }
    title: Response
    language: json
---
