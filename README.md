# URLRequestCacheExample
Explain what's meaning URLRequestCachePolicy in iOS

讲解文章地址: http://47.99.237.180:8080/articles/2020/01/01/1577848007883.html (不好意思，域名还差几天才能转到阿里云。 腾讯云实在有点。。 。算了)

这个项目是为了结合文章理解，iOS当中的URLRequestCache和Policy的使用，项目中分为iOS和Server两个端，先将Server端开启，然后运行iOS端，分别进入不同的缓存策略，观看终端的输出，来理解缓存是如何工作的。

## Example Screenshot

Example项目截图

<div>
<img style="float: left;" src="http://47.99.237.180:2088/files/870dfad554bc6fed966640cc5796f825" width="400" height="400" />

<img style="float: left;" src="http://47.99.237.180:2088/files/fbe98d38bae77dfd6b8dd8a3d1f02a10" width="400" height="400" />
</div>

## Usage

> 开启Terminal(终端)，输入一下命令

进入项目的Server根目录
1. `$ cd URLRequestCacheDemo/Server`
开启Server，保持终端窗口，看到 Listen 2001 port！即成功，否则请先安装 `Node`，示例Demo的Server使用的是Express框架。
2. `node app.js`
3. 运行iOS的Examle应用

结合文章，进行验证操作。

## Author

zColdWater

## License

HttpInterceptor is available under the MIT license. See the LICENSE file for more info.
