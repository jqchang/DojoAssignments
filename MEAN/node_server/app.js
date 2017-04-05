var http = require('http');

var fs = require('fs');

var server = http.createServer(function(request, response) {
  console.log('client request URL:', request.url);
  // Route = '/'
  if(request.url ==='/') {
    fs.readFile('index.html', 'utf8', function(errors, contents){
      response.writeHead(200, {'Content-Type': 'text/html'});
      response.write(contents);
      response.end();
    });
  }
  else if(/^\/testing$/.test(request.url)) {
    response.writeHead(200, {'Content-Type': 'text/html'});
    response.end('testing testing');
  }
  else {
    response.writeHead(404);
    response.end('File not found!!!');
  }
});

server.listen(8000);
console.log("Running in localhost at port 6789");
