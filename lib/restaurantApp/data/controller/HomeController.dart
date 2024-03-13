import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../model/RestaurantHeader.dart';
import '../api/ApiService.dart';

class HomeController extends GetxController {
  final _apiService = ApiService();

  final restaurantHeader = Rx<RestaurantHeader?>(null);
  final errorMessage = Rx<String?>(null); // Observable for error

  Future<RestaurantHeader?> fetchRestaurantHeader() async {
    try {
      final header = await _apiService.getList();
      restaurantHeader.value = header;
      errorMessage.value = null; // Clear any previous errors
      return header; // Return the fetched data
    } catch (e) {
      errorMessage.value = e.toString(); // Set error message
      print('Error fetching restaurant header: $e');
      return null; // Return null to indicate error
    }
  }
}