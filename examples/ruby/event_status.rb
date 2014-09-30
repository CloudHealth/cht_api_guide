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

# Fetch all AwsInstanceStatus objects that have a description
events = get_report(API_KEY, "AwsInstanceStatus", "event_description<>''&include=instance")
puts JSON.pretty_generate(events)
events.each do |event|
  instance = event["instance"]
  puts instance["instance_id"] unless instance.nil?
end

