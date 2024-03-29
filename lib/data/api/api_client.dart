import 'package:get/get_connect/connect.dart';
import '../../utils/app_constants.dart';

class ApiClient extends GetConnect {
  late String token;
  final String appBaseUrl;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;
  }

  Future<Response> getData(String uri) async {
    try {
      final response = await get(uri, headers: {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
      return response;
    } catch (e) {
      // Handle any exceptions that occur during the API call
      print('Error fetching data: $e');
      return Response(statusCode: 500, statusText: e.toString());
    }
  }
}