#!/usr/bin/env python

import urlparse
import urllib2
import json

API_ENDPOINT = "https://chapi.cloudhealthtech.com/olap_reports/"
API_KEY = "<your api key>"

# Returns json for requested report.
def get_report(report, api_key):
  uri = urlparse.urljoin(API_ENDPOINT, report)
  uri += "?api_key=%s" % API_KEY
  request  = urllib2.Request(uri, headers={"Accept" : "application/json"})
  response = urllib2.urlopen(request)
  page = response.read()
  return json.loads(page)

# Fetch the json for the report
try:
  data = get_report("cost/history", API_KEY)

  # Get list of dimension names
  dimensions = [dim.keys()[0] for dim in data["dimensions"]]

  # Output a CSV for this report
  print "Month,%s" % ",".join( [member["label"] for member in data['dimensions'][1][dimensions[1]]])
  index = 0
  for month in data["dimensions"][0][dimensions[0]]:
    row = data['data'][index]
    if row == None:
      continue

    # We have only selected 1 measure so just take first element of every array
    row_as_array = [str(item[0]) for item in row]
    print "%s,%s" % (month["label"], ",".join(row_as_array))
    index+=1

except urllib2.HTTPError as e:
  print e.code
  print e.read()
