---
title: How to Use the CloudHealth API
category: documentation
position: 2
parameters:
  - name:
    content:
content_markdown: |-
  The goal of the CloudHealth API is to let you write your own applications that leverage and extend CloudHealth functionality.

  The CloudHealth API provides programmatic access to functionalities in the CloudHealth platform using REST-based arguments and JSON-formatted responses.

  You send REST API requests to various endpoints to retrieve and update data from the CloudHealth Platform. Different API functionality can be found at different endpoints. Here are some example endpoints.
  * `https://chapi.cloudhealthtech.com/olap_reports/cost/history`
  * `https://chapi.cloudhealthtech.com/v1/perspective_schemas`

  Using the API, you can query the following areas of the CloudHealth Platform.
  * Reporting
  * Asset
  * Account
  * Metrics
  * Tagging
  * Perspectives
  * Partner
  * Partner Customer Provisioning
  * Partner AWS Account Assignment
  * Customer Statement

  #### Anatomy of a Request
  Here's a REST-based request that uses the CloudHealth API.

  ```
  curl -H 'Authorization: Bearer XXXXX98900000YYYY' -H 'Accept: application/json' 'https://chapi.cloudhealthtech.com/olap_reports/cost/history?interval=monthly'
  ```

  Let's break down this request.
  * `cURL` is a command-line REST client (https://curl.haxx.se).
  * The `-H` flags represent the headers that you need to pass with each request. There are two headers that each request must contain:
     * `-H 'Authorization: Bearer XXXXX98900000YYYY'` is the authorization header. It attaches your unique API key to the request. Here, `XXXXX98900000YYYY` is your API Key. See [How CloudHealth Validates API Requests](#how-cloudhealth-validates-api-requests).
     * `- H 'Accept: application/json'` is the communication header. You can also specify this header as `-H 'Content-Type:application/json'`.
     * The optional header `Accept-Encoding:gzip` compresses the communication with GZIP compression.
  * `https://chapi.cloudhealthtech.com/olap_reports/cost/history` is the REST endpoint. In this example, the endpoint returns data for the **Standard Cost History Report**.
  * If you prefer to pass your API key as a query parameter, instead of using an authorization header, use `api_key=XXXXX98900000YYYY` to attach your unique API key with the request. Here, `XXXXX98900000YYYY` is your API Key.
  * `interval=monthly` is a query parameter that you append to the REST endpoint. Query parameters allow you to constrain the data returned from a request. You can attach multiple query parameter as long as each parameter is separated from the next by the `&` symbol.
  * A URI string is made up of the REST endpoint and all the query parameters attached to it. In this example, this is the URI string.
    ```
    https://chapi.cloudhealthtech.com/olap_reports/cost/history?interval=monthly
    ```
    The maximum permissible length of a URI string is **4000** characters.
    {:.warning}

  #### Types of Requests
  * GET requests retrieve data from the CloudHealth Platform.
    ```
    curl 'https://chapi.cloudhealthtech.com/olap_reports/cost/history?interval=monthly'
      -H 'Authorization: Bearer XXXXX98900000YYYY'
      -H 'Accept: application/json'
    ```
  * POST requests send data to the CloudHealth Platform. They include a JSON-formatted message body, which contains the data that should be sent. Here, the message body is specified as a parameter following the `-d` flag.

  * The `Content-Type: application/json` header is required when PUTting or POSTing JSON to the API, else an HTTP 422 Unprocessable Entity is issued

    ```
    curl 'https://chapi.cloudhealthtech.com/v1/perspective_schemas'
      -H 'Authorization: Bearer XXXXX98900000YYYY'
      -H 'content-type: application/json'
      -d '{
        "schema":{
          "name":"Environment-API",
          "rules":[{"type":"categorize","asset":"AwsAsset","tag_field":["cht_env"],"ref_id":"206159110488","name":"Env"}],
          "merges":[],
          "constants":[…]}
        }'
    ```
    All examples in the CloudHealth REST API documentation have been tested on the Git Bash shell terminal. To use the examples in the Windows Command prompt, replace the single quotes in the curl request with double quotes. For example:
    ```curl -H "Authorization: Bearer XXXXX98900000YYYY" -H "Accept: application/json" "https://chapi.cloudhealthtech.com/olap_reports/cost/history?interval=monthly"```
    {:.warning}
left_code_blocks:
  - code_block:
    title:
    language:
right_code_blocks:
  - code_block:
      This area displays code examples that you can copy and paste into a terminal. Before running these examples, make sure you replace placeholder values enclosed within angle brackets <> with actual values.

      For example, all API queries must include your unique API Key in the authorization header. The value of this key is indicated as <your_api_key> in these code examples. Replace this placeholder value with your actual API Key.
    title: Code Example Pane
    language: none
---
