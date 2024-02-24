import 'package:get/get.dart';
import 'package:todoflutterandgo/services/services.dart';

class DataControler extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List get myData => _myData;

  Future<void> getData() async {
    _isLoading = true;
    update(); // Notify listeners that loading state has changed

    try {
      Response response = await service.getData();
      if (response.statusCode == 200) {
        _myData = response.body;
        print("Data retrieved successfully");
      } else {
        print("Failed to retrieve data");
      }
    } catch (e) {
      print("Error retrieving data: $e");
    } finally {
      _isLoading = false; // Reset loading state regardless of success or failure
      update(); // Notify listeners that loading state has changed
    }
  }
}
