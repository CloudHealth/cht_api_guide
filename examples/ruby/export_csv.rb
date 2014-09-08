#!/usr/bin/env ruby

require "rubygems"
require "net/https"
require "uri"
require "json"

API_ENDPOINT = "https://apps.cloudhealthtech.com/olap_reports/"
API_KEY = "<your api key>"

# Returns json for requested report.
def get_report(report, api_key)
  uri = URI(API_ENDPOINT) + report + "?api_key=#{api_key}"
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  raise "Server returned error #{response.code} processing your API request" if response.code != "200"
  JSON.parse(response.body)
end

# Fetch the json for the report
json = get_report("cost/history", API_KEY)

# Get list of dimension names
dimensions = json["dimensions"].collect{|dim| dim.keys.first }

# Output a CSV for this report
puts "Month,#{json["dimensions"][1][dimensions[1]].join(',')}\n"
index = 0
json["dimensions"][0][dimensions[0]].each do |month|
  row = json['data'][index]
  next if row.nil?
  # We have only selected 1 measure so just take first element of every array
  row_as_array = row.collect{|item| item[0]}
  puts "#{month},#{(row_as_array.join(','))}\n"
  index+=1
end
