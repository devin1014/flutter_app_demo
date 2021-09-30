import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/device/deviceInfo.dart';

class DeviceInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  String response = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dio Demo')),
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
        onPressed: () async {
          var userAgent = await getDeviceUserAgent();
          setState(() {
            response = userAgent;
          });
        },
        tooltip: 'http request',
        child: Icon(Icons.done),
      ),
    );
  }
}
