// ignore_for_file: unused_field

import 'package:get/get_connect/connect.dart';

class ApiClient extends GetConnect {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
   // _mainHeaders={
   //  'Content-type':'application/json; charset=UTF-8',
   //   'Authorization' : 'Bearer $token',
   // };
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}