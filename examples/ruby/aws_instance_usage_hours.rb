#!/usr/bin/env ruby

require "rubygems"
require "net/https"
require "uri"
require "json"

API_ENDPOINT = "https://chapi.cloudhealthtech.com/api/search.json"
API_KEY = "<your api key>"

# Returns json for requested assets.
def get_report(api_key, object_name, query = "")
  uri = URI(API_ENDPOINT) + URI.escape("?api_key=#{api_key}&name=#{object_name}&query=#{query}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  raise "Server returned error #{response.code} processing your API request" if response.code != "200"
  JSON.parse(response.body)
end

# Fetch all AwsInstanceUsageHoursMonthly objects for the current month
month = Time.now.strftime '%Y-%m-01'
usage_hours = get_report(API_KEY, 'AwsInstanceUsageHoursMonthly', "month='#{month}'")
usage_hours.each do |usg|
  instance_id = usg['aws_instance_instance_id']
  hours       = usg['total_hours']
  cost        = usg['total_cost']
  row         = "| %12s | %3d hours | %8s |"
  puts row % [ instance_id, hours, cost ]
end
