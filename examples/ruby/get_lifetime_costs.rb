#!/usr/bin/env ruby

#
# Insert your API_KEY from CloudHealth and run
# $ ruby get_lifetime_costs.rb
#
# Will output a table of lifetime costs for all current assets.
#
# Script takes one optional argument.
# $ ruby get_lifetime_costs.rb "instance_id='i-f74de4da'"
#
# Will limit to queried asset.
#

require "rubygems"
require "net/https"
require "uri"
require "json"
require 'date'
require 'pry'

CACHE_DIR      = '/tmp/cht_cache'
@monthly_costs = {}

API_ENDPOINT = "https://chapi.cloudhealthtech.com/api/search.json"
API_KEY      = "<your-key-here>"

#
# Returns json for requested assets.
#
def get_report(api_key, object_name, query = "")
  uri = URI(API_ENDPOINT) + URI.escape("?api_key=#{api_key}&name=#{object_name}&query=#{query}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = false #true
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  raise "Server returned error #{response.code} processing your API request" if response.code != "200"
  response.body
end


#
# Determines if the cost for the month needs to be updated.
# Do it for current month (always) and up to the 10th for the previous month
#
def refresh_month?(month)
  td         = Date.today
  curr_month = td.strftime '%Y-%m-01'
  prev_month = td.prev_month.strftime '%Y-%m-01'
  refresh = (month == curr_month || (month == prev_month && td.day < 10))
  refresh
end

#
# Retrieves the list of assets matching query passed in.
#
def get_instances(query)
  assets_json = get_report(API_KEY, 'AwsInstance', query)
  JSON.parse(assets_json)
end

#
# The span of months over which an asset with given launch time
# will have costs, over the last 12.
#
def month_list(launch_time)
  month        = Date.parse Date.today.strftime '%Y-%m-01'
  launch_month = Date.parse(launch_time[0,8] + "01")
  months = []
  12.times do
    break if month < launch_month
    months << month
    month = month << 1
  end
  months.map { |d| d.strftime '%Y-%m-01' }.reverse
end

#
# Returns a Hash of instance_id -> $cost for the given month.
# It will look in local cache to avoid multiple expensive calls.
# It will also make sure to refresh the month if needed.
#
def get_monthly_costs(month)
  if @monthly_costs[month].nil? then
    if refresh_month?(month) then
      @monthly_costs[month] = fetch(month)
    else
      @monthly_costs[month] = read_month(month)
      if @monthly_costs[month].nil? then
        @monthly_costs[month] = fetch(month)
      end
    end
  end
  @monthly_costs[month]
end

#
# Fetches the instance-usage for the month from the server.
# Updates cache.
#
def fetch(month)
  print "Fetching data for #{month}..."
  usage_hours_json = get_report(API_KEY, 'AwsInstanceUsageHoursMonthly', "month='#{month}'")
  print "#{usage_hours_json.size} bytes\n"
  write_month(month, usage_hours_json)
  iuh = JSON.parse(usage_hours_json)
  make_hash(iuh)
end

#
# Read monthly cost from cache, if available.
# Returns nil if missing.
#
def read_month(month)
  path = File.join(CACHE_DIR, "#{month}.json")
  if File.exist?(path) then
    usage_hours_json = IO.binread(path)
    iuh = JSON.parse(usage_hours_json)
    make_hash(iuh)
  end
end

#
# Takes instance-usage JSON from report query and converts
# into a { instance-id -> cost } Hash for easy lookup
# when summing lifetime costs.
#
def make_hash(iuh)
  iuh.inject({}) do |h, i|
    iid = i['aws_instance_instance_id']
    cost = i['full_cost'].slice(1..-1).to_f
    h[iid] = cost
    h
  end
end

#
# Write month into cache.
#
def write_month(month, json)
  path = File.join(CACHE_DIR, "#{month}.json")
  IO.binwrite(path, json)
end

#
# Cost of an instance for a specific month.
#
def get_cost_for_month(instance_id, month)
  monthly_costs=get_monthly_costs(month)
  monthly_costs[instance_id]
end

#
# Returns lifetime cost for the asset with given instance-id.
#
def get_lifetime_cost(instance_id, launch_date)
  cumul_cost = 0
  month_list(launch_date).each do |month|
    cost_for_month =  get_cost_for_month(instance_id, month)
    cumul_cost     += cost_for_month if cost_for_month
  end
  cumul_cost
end

#
# Main script to run when invoked as file.
# Only argument is query to limit the assets to report on.
# If no argument is passed in, all active assets are listed.
#
if __FILE__ == $0 then
  query = ARGV.first || "is_active=1"
  get_instances(query).each do | instance_data |
    instance_id, name, launch_date = [:instance_id, :name, :launch_date].map {|s| instance_data[s.to_s] }
    lifetime_cost = get_lifetime_cost(instance_id, launch_date)
    puts "| %12s | $%7.2f | %40s |" % [ instance_id, lifetime_cost, name ]
  end
end
