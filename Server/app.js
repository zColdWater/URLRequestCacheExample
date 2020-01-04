var bodyParser = require('body-parser')

var express = require('express');
var app = express();

app.use( bodyParser.json() );       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
})); 

// 打印请求头
app.all('*', (req, res, next) => {
  console.log("===============请求头===============");
  console.dir(req.originalUrl)
  console.log(req.headers);
  next();
});

// 打印响应头
app.use(function (req, res, next) {
    res.on('finish', function() {
    console.log("===============状态码===============");
    console.log("statusCode:"+res.statusCode); 
		console.log("===============响应头===============");
		console.log(res.getHeaders());
		console.log("===================================");
		console.log("\n");
    console.log(Math.floor(Math.random() * (999999 - 899999 + 1) + 899999));
    console.log("\n");
    });
    next();
});

// 只返回 ETag 
app.use(express.static('http_etag', {
  lastModified: false,
  cacheControl: false,
  setHeaders: function(res, path) {
  }
}));

// 只返回 LastModified 
app.use(express.static('http_last_modify', {
  etag: false,
  cacheControl: false,
  setHeaders: function(res, path) {
  }
}));

// 只返回 CacheControl: max-age=x
app.use(express.static('http_max_age', {
  etag: false,
  lastModified: false,
  setHeaders: function(res, path) {
	res.set("cache-control", "public, max-age=12");
  }
}));

// CacheControl， LastModified ， Etag 都有。
app.use(express.static('http_normal'));

app.listen(2001, function () {
  console.log('Example app listening on port 2001!');
});
