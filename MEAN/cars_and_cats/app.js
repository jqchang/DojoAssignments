var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){
  console.log("Received request url:", request.url);
  // Views
  if(request.url === '/cars') {
    fs.readFile('./views/cars.html', 'utf8', function(errors, contents) {
      response.writeHead(200, {'Content-type':'text/html'});
      response.write(contents);
      response.end();
    });
  }
  else if(request.url === '/cars/new') {
    fs.readFile('./views/new.html', 'utf8', function(errors, contents) {
      response.writeHead(200, {'Content-type':'text/html'});
      response.write(contents);
      response.end();
    });
  }
  else if(request.url === '/cats') {
    fs.readFile('./views/cats.html', 'utf8', function(errors, contents) {
      response.writeHead(200, {'Content-type':'text/html'});
      response.write(contents);
      response.end();
    });
  }
  // End views

  // Stylesheets
  else if(request.url === '/stylesheets/gallery.css') {
    fs.readFile('./stylesheets/gallery.css', 'utf8', function(errors, contents) {
      response.writeHead(200, {'Content-type': 'text/css'});
      response.write(contents);
      response.end();
    });
  }
  // End stylesheets

  // Images
  else if(request.url === '/images/Custom_volkswagen_beetle_2012_blue.png') {
    fs.readFile('./images/Custom_volkswagen_beetle_2012_blue.png', function(errors, contents) {
      response.writeHead(200, {'Content-type': 'image/png'});
      response.write(contents);
      response.end();
    });
  }
  else if(request.url === '/images/Ferrari_575_GTC_01.jpg') {
    fs.readFile('./images/Ferrari_575_GTC_01.jpg', function(errors, contents) {
      response.writeHead(200, {'Content-type': 'image/jpg'});
      response.write(contents);
      response.end();
    });
  }
  else if(request.url === '/images/giphy.gif') {
    fs.readFile('./images/giphy.gif', function(errors, contents) {
      response.writeHead(200, {'Content-type': 'image/jpg'});
      response.write(contents);
      response.end();
    });
  }
  else if(request.url === '/images/20160624_210632.jpg') {
    fs.readFile('./images/20160624_210632.jpg', function(errors, contents) {
      response.writeHead(200, {'Content-type': 'image/jpg'});
      response.write(contents);
      response.end();
    });
  }
  else if(request.url === '/images/20161105_151247.jpg') {
    fs.readFile('./images/20161105_151247.jpg', function(errors, contents) {
      response.writeHead(200, {'Content-type': 'image/jpg'});
      response.write(contents);
      response.end();
    });
  }
  else if(request.url === '/images/20161127_151428.jpg') {
    fs.readFile('./images/20161127_151428.jpg', function(errors, contents) {
      response.writeHead(200, {'Content-type': 'image/jpg'});
      response.write(contents);
      response.end();
    });
  }
  // End images

  // Errors
  else {
    response.writeHead(404);
    response.end("File not found!!!");
  }
  // End errors
});

server.listen(7077);
console.log("Listening on localhost at port 7077");
