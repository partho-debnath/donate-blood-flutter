import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import '../models/network_response.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest({
    required String url,
    bool loginRequired = false,
  }) async {
    try {
      const String token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE5MTU2MzY1LCJpYXQiOjE3MTg1NTE1NjUsImp0aSI6ImNlNzFlMTY2ZDQzNzRlYjhhYmNmZWJiYjYzMGQwYWQxIiwidXNlcl9pZCI6M30.sZW0b9Vg2DyJJuZDYL5uBEBUdNB28jnt6aUrTdhgST0';
      final Response response = await get(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      log('---------------------');
      if (response.statusCode == 200) {
        log('NetworkCaller: Ok');
        Map<String, dynamic> data = jsonDecode(response.body);
        print(data.runtimeType);
        // print(data);
        return NetworkResponse.fromJson(data);
      }

      Map<String, dynamic> data = jsonDecode(response.body);
      print(data.runtimeType);
      // print(data);
      return NetworkResponse.fromJson({});
    } catch (e) {
      log(e.toString());
      return NetworkResponse('-1', -2, null, null);
    }
  }
}
