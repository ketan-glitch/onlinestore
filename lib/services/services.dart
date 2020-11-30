import 'dart:convert';
import 'package:http/http.dart';

class Services {
  static const String url =
      'https://run.mocky.io/v3/43929819-0a6f-498e-8f6e-f8841bc64b7a';
  static Future<Map<String, List>> getdata() async {
    try {
      final response = await get(url);
      if (200 == response.statusCode) {
        Map<String, List> data = jsonDecode(response.body);
        print('Service');
        print(data);
        return data;
      } else {
        print('ElseService');
        return Map<String, dynamic>();
      }
    } catch (e) {
      print('CatchService');
      return Map<String, List>();
    }
  }
}
