#!/usr/bin/env ruby

require "rubygems"
require "net/https"
require "uri"
require "json"
require 'date'
require 'pry'

CACHE_DIR    = '/tmp/cht_cache'
@monthly_costs = {}

API_ENDPOINT = "https://chapi.cloudhealthtech.com/api/search.json"
API_KEY      = "<your-key-here>"

#
# Returns json for requested assets.
#
def get_report(api_key, object_name, query = "")
  uri = URI(API_ENDPOINT) + URI.escape("?api_key=#{api_key}&name=#{object_name}&query=#{query}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
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
# 
#
def get_instances(query)
  if query.nil? then
    query = "is_active=1"
  end
  assets_json = get_report(API_KEY, 'AwsInstance', query)
  JSON.parse(assets_json)
end

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

def fetch(month)
  print "Fetching data for #{month}..."
  usage_hours_json = get_report(API_KEY, 'AwsInstanceUsageHoursMonthly', "month='#{month}'")
  print "#{usage_hours_json.size} bytes\n"
  write_month(month, usage_hours_json)
  iuh = JSON.parse(usage_hours_json)
  make_hash(iuh)
end

def read_month(month)
  path = File.join(CACHE_DIR, "#{month}.json")
  if File.exist?(path) then
    usage_hours_json = IO.binread(path)
    iuh = JSON.parse(usage_hours_json)
    make_hash(iuh)
  end
end

def make_hash(iuh)
  iuh.inject({}) do |h, i|
    iid = i['aws_instance_instance_id']
    cost = i['full_cost'].slice(1..-1).to_f
    h[iid] = cost
    h
  end
end

def write_month(month, json)
  path = File.join(CACHE_DIR, "#{month}.json")
  IO.binwrite(path, json)
end

def get_cost_for_month(instance_id, month)
  monthly_costs=get_monthly_costs(month)
  monthly_costs[instance_id]
end

def get_lifetime_cost(instance_id, launch_date)
  cumul_cost = 0
  month_list(launch_date).each do |month|
    cost_for_month =  get_cost_for_month(instance_id, month)
    cumul_cost     += cost_for_month if cost_for_month
  end
  cumul_cost
end

if __FILE__ == $0 then
  query = $1
  get_instances(query).each do | instance_data |
    instance_id, name, launch_date = [:instance_id, :name, :launch_date].map {|s| instance_data[s.to_s] }
    lifetime_cost = get_lifetime_cost(instance_id, launch_date)
    puts "| %12s | $%7.2f | %40s |" % [ instance_id, lifetime_cost, name ]
  end
end
