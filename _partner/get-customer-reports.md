---
title: Specific Customer Report
position: 2
description: Retrieve a specific Standard Report for a specific customer tenant.
type: get
endpoint: https://chapi.cloudhealthtech.com/olap_reports/:report-type/:report-id
parameters:
  - name: client_api_id
    required: yes
    content: String that specifies the unique customer API Key that CloudHealth generates.
right_code_blocks:
  - code_block: |-
      curl -H "Accept: application/json" "https://chapi.cloudhealthtech.com/olap_reports/cost/history?api_key=<your_api_key>&client_api_id=<customer_api_id>"
    title: Bash Request
    language: bash
  - code_block: |-
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
    title: Ruby Request
    language: ruby
---
