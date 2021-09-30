import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DIOPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DIOPageState();
}

class _DIOPageState extends State<DIOPage> {
  String response = '';

  //https://neulion-a.akamaihd.net/nlmobile/wnba/config/2021/appconfig_ios_r1.nmc
  //https://mobile.neulion.net.cn/svn/stable-frameworks.json
  void _requestHttp() async {
    var response = await Dio()
        .get("https://mobile.neulion.net.cn/svn/stable-frameworks.json");
    setState(() {
      this.response = response.data.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dio Demo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('response:'),
          Expanded(
              child: Scrollbar(
                  child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: false,
            padding: EdgeInsets.all(12),
            child: Text(
              '$response',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          )))
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
