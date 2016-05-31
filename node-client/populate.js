var request = require("request");

var arg_host = function() {
  var result = null;
  if (process.argv.length > 2) {
    var match = process.argv[2].match(/host=([\w\:\/\.\?\&\=]+)/);
    console.log(match[1]);
    if (match) { result = match[1]; }
  }
  return(result);
}();

// arg_host = "http://api.example.com:3000/populate?page=4&perpage=5&total=20";

if (arg_host) {
  request(arg_host, function(error, response, body) {
    if (!error && response.statusCode == 200) {
      var jsonData = JSON.parse(body);
      jsonData.forEach(function(elem){
        console.log(elem.key + ': ' + elem.value);
      });
    } else {
      console.log('Ups! Something want wrong.')
    };
  });
} else {
  console.log("Usage: node populate host='http://api.example.com:3000/populate?page=4&perpage=5&total=20'");
  console.log("   or: node populate host='http://api.example.com:3000/populate'");
}