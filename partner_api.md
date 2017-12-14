### Overview

The Partner API uses the same request and response patterns as described in the [Reporting API](https://github.com/CloudHealth/cht_api_guide#reporting-api) with one distinction. In the CloudHealth Partner environment, there is a hierarchy of Partner-Customer, which is represented as

Partner

- Customer 1

- Customer 2

- Customer 3

- Customer n

For Partners, it is important to be able to query the API and get results for both the Partner and their customers.

### Accessing Partner Customer Data

To access the results for the customer of a partner there are two methods. The first is to setup a CloudHealth user in the customer, and generate an API key for that user. Queries to that API Key will return results for only that customer. In the case of costs, these will be the post-processed costs as written by Partner Billing.

The downside of this method is that, it requires maintaining users in each customer. The preferred method is to use a compound key `<api_key>` `<client_api_id>`. The Client API Key is unique for each Customer of a Partner. It is automatically generated and is available from the Partner Customer Page

In commands this is expressed as:

```
&api_key=<api_key>&client_api_id=<client_api_id>
```

Here the form of a full cURL command for a Cost History Report: 
 

```bash
curl -H "Accept: application/json" "https://chapi.cloudhealthtech.com/olap_reports/cost/history?api_key=<api_key>&client_api_id=<client_api_id>"
```

Here is the command with a sample set of IDs

```bash
curl -H "Accept: application/json" "https://chapi.cloudhealthtech.com/olap_reports/cost/history?api_key=<api_key>&client_api_id=732"
```

Asset API queries are similar. To list the accounts for a customer, and their metadata:

```bash
curl https://chapi.cloudhealthtech.com/api/search.json?api_version=2&api_key=<api_key>&client_api_id=<client_api_id>&name=AwsAccount
```

With sample ids:

```bash
curl "https://chapi.cloudhealthtech.com/api/search.json?api_version=2&api_key=9e0214340-139b-0133-1689-22000b100046&client_api_id=732&name=AwsAccount"
```

Example Ruby Script

Note that in addition to passing in the `API_ENDPOINT`, and the `API_KEY`, you are passing an additional parameter `CLIENT_API_ID`

```ruby
#!/usr/bin/env ruby

require "rubygems"
require "net/https"
require "uri"
require "json"

API_ENDPOINT = "https://chapi.cloudhealthtech.com/olap_reports/cost/history"
API_KEY = "<your api key>"
CLIENT_API_ID = "<api id for client>"

# Returns json for requested assets.
def get_report(api_key, client_api_id, interval, query = "")
  uri = URI(API_ENDPOINT) + URI.escape("?api_key=#{api_key}&client_api_id=#{client_api_id}&interval=#{interval}&query=#{query}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  raise "Server returned error #{response.code} processing your API request" if response.code != "200"
  JSON.parse(response.body)
end

# Fetch all CostHistory objects for the current month
month = Time.now.strftime '%Y-%m-01'
cost_history = get_report(API_KEY, CLIENT_API_ID, 'monthly')
months = cost_history["dimensions"][0]["time"].collect{ |t| t["label"] }
puts "| Month:\tCost"
puts "|----------------------------------|"
months.each_with_index do | month, i |
  costs =  cost_history["data"].collect{ |month_cost| month_cost[0][0] }
  row = "| %12s | %12s | %12s | %12s | %12s | %12s | %12s | %12s | %12s | %12s | %12s | %12s |"
  puts "| #{month}:\t#{cost_history["data"][i][0][0]}"
end

```
