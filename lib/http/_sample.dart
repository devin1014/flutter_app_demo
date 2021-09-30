import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

main() async {
  var dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    var userAgent = options.headers['userAgent'];
    if (userAgent == null) {
      userAgent = 'Flutter dio v4.0.0';
      if (Platform.isAndroid) {
        userAgent = 'Android';
      } else if (Platform.isIOS) {
        userAgent = 'IOS';
      }
      options.headers[HttpHeaders.userAgentHeader] = userAgent;
    }
    handler.next(options);
  }));
  dio.interceptors.add(LogInterceptor(responseBody: false));
  await dio
      .get('https://baidu.com/')
      .then((value) => null)
      .catchError((err) => null);
  //print(response.data);
  // Print cookies
  // print(cookieJar.loadForRequest(Uri.parse('https://baidu.com/')));
  // second request with the cookie
  await dio.get('https://baidu.com/');
}
