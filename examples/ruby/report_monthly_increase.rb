#!/usr/bin/env ruby

require "rubygems"
require "net/https"
require "uri"
require "json"
require 'csv'

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

# Returns the members in a dimension provided its name.
def get_dimension_members(json, dimension_name)
  dim = json["dimensions"].select{|dimension| dimension.keys.first == dimension_name}.first
  return nil if dim.nil?
  dim[dimension_name]
end

def get_month_index(month)
  if String === month
    @months.index  { |st| st["name"] == month_name }
  else
    month > 0 ? month : (@months.size + month)
  end
end

# Fetch the cost for a specific service type (e.g. EC2 Compute) for a specified month.
def get_cost_for(service_type, month)
  it_index     = @service_types.index { |st| st["name"] == service_type }
  month_index  = get_month_index month
  metric_index = @metrics.index  { |st| st["name"] == 'cost' }
  data     = @data['data']
  data[it_index] && data[it_index][month_index] && data[it_index][month_index][metric_index]
end

# Returns the cost increase month over month for the specified service type (e.g. EC2 Compute).
def analyze_cost_increase_for_service_type(service_type)
  ## If report runs after month end, current month is partial, last full month = -2
  #  On September 01, Report on increase between July -> August
  #  On October   01, Report on increase between August -> September without any code change
  cost_last_month = get_cost_for(service_type, -2).to_f
  cost_prev_month = get_cost_for(service_type, -3).to_f
  pct = ((cost_last_month - cost_prev_month)/cost_prev_month*100.0)
  puts "#{service_type} cost went from $#{cost_prev_month} to $#{cost_last_month} month-over-month, a change of #{pct}%"
end

# Returns the cost increase month over month for tall service types.
def analyze_cost_increase_for_all_service_types
  puts "Analyzing for all service_types"
  service_types = @service_types.dup
  service_types.each do |service_type|
    next if service_type["name"] == 'total'
    analyze_cost_increase_for_service_type service_type["name"]
  end
end

# Fetch the json for the report
@data = get_report("cost/history", API_KEY)
@metrics = @data["measures"]
@service_types = get_dimension_members(@data, "AWS-Service-Category")
@months = get_dimension_members(@data, "Past-12-Months")

# Output the month over month cost increase for EC2 Compute
analyze_cost_increase_for_service_type('ec2_compute')

puts "---"

# Output the month over month cost increase for all service items
analyze_cost_increase_for_all_service_types



