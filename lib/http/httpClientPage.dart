import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class HttpClientPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHttpClientPage();
}

class _MyHttpClientPage extends State<HttpClientPage> {
  String response = '';

  //https://neulion-a.akamaihd.net/nlmobile/wnba/config/2021/appconfig_ios_r1.nmc
  //https://mobile.neulion.net.cn/svn/stable-frameworks.json
  void _requestHttp() async {
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(
        Uri.parse('https://mobile.neulion.net.cn/svn/stable-frameworks.json'));
    request.headers.add('user-agent', 'flutter http client');
    var response = await request.close();
    print(response.headers);
    var responseBody = await response.transform(utf8.decoder).join();
    //parse response to json
    Map data = jsonDecode(responseBody);
    setState(() {
      this.response = responseBody.replaceAll(new RegExp(r'\s'), '');
    });
  }

  //TODO: 1.response不能滚动
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Http Client Demo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('response:'),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: false,
            padding: EdgeInsets.all(12),
            child: Text(
              '$response',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _requestHttp,
        tooltip: 'http request',
        child: Icon(Icons.done),
      ),
    );
  }
}
