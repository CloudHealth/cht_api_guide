// Note: npm install request to use this example
var https = require('https');
var request = require('request');

var API_ENDPOINT = 'https://chapi.cloudhealthtech.com/olap_reports/';
var API_KEY = '<your api key>';

uri = API_ENDPOINT + 'cost/history' + '?api_key=' + API_KEY;
request(uri, function(error, response, body) {
  json = JSON.parse(body);

  // Get list of dimension names
  var dimensions = [];
  json.dimensions.forEach(function(dim) {
    dimensions.push(Object.keys(dim)[0]);
  });

  console.log('Month,' + json.dimensions[1]['AWS-Service-Category'].join(',') );
  var index = 0;

  // Output a CSV for this report
  json.dimensions[0]['Past-12-Months'].forEach(function(month) {
    row = json.data[index];
    if (row !== null) {
      row_as_array = [];
      row.forEach(function(item) {
        row_as_array.push(item[0]);
      });

      console.log(month + ',' + row_as_array.join(','));
      index+=1;
    }
  });
});

