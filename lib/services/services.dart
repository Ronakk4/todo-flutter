import 'package:get/get.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData() async {
    try {
      Response response = await get(
       "http://192.168.29.7:8000/gettasks",
        headers: {
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.bodyString}');
      return response;
    } catch (e) {
      print('Error during data retrieval: $e');
      rethrow; // Rethrow the error to handle it at the caller's level
    }
  }
}
