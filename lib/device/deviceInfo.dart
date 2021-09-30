import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

getDeviceUserAgent() async {
  try {
    if (Platform.isAndroid) {
      var info = await DeviceInfoPlugin().androidInfo;
      return '${info.model}/OS${info.version.release}';
    } else if (Platform.isIOS) {
      var info = await DeviceInfoPlugin().iosInfo;
      return '${info.utsname.machine}/OS${info.systemVersion}';
    } else {
      var info = await DeviceInfoPlugin().webBrowserInfo;
      return info.userAgent;
    }
  } catch (e) {
    print(e);
    return "flutter dio v4.0.0";
  }
}
