#!/usr/bin/env ruby

require "rubygems"
require "net/https"
require "pp"
require "uri"
require "json"

API_ENDPOINT = "https://chapi.cloudhealthtech.com/metrics/v1"
API_KEY = "<your-api-key-here>"

# Construct the header with as many of the keys that are currently supported
def header
  {
    'assetType' => 'aws:ec2:instance',
    granularity:   'hour',
    keys: [
      'assetId',
      'timestamp',
      'memory:free.avg',
      'memory:free.max',
      'memory:free.min'
    ]
  }
end

# Construct this data block for script to read a csv file which contains the metric values
# Create a file "metrics_data in the same folder with comma delimited values aligning with the keys in the header block above"
def data
  result = []
  File.open("metrics_data", "r") do |handle|
    handle.each_line do |line|
      result << line.chomp.split(",")
    end
  end
  result
end

# Construct the message block for the payload to be delivered; notice api_key and dry_run options
def message
  {
    metrics: {
      datasets: [
        {
          metadata: header,
          values: data
        }
      ]
    },
    # Some HTTP clients make it difficult to use a POST body and a query string.
    # If you're using such a library, you can put your API key in the body.
    api_key: API_KEY,
    dry_run: true
  }
end

# The method that makes the API call and posts the payload
def post_to_cloudhealth
  uri = URI(API_ENDPOINT)
  request = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' => 'application/json'})
  request.body = message.to_json


  response = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    http.request(request)
  end

  puts JSON.parse(response.body)
  raise "Server returned error #{response.code} processing your API request" if response.code != "200"
end

post_to_cloudhealth