import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:restaurant_app/restaurantApp/model/RestaurantSearch.dart';

import '../api/ApiService.dart';

class SearchStateController extends GetxController {
  final query = RxString("");
  final _apiService = ApiService();

  final restaurantSearch = Rx<RestaurantSearch?>(null);
  final errorMessage = Rx<String?>(null); // Observable for error

  Future<RestaurantSearch?> searchRestaurant() async {
    try {
      final header = await _apiService.getSearch(query.value);
      restaurantSearch.value = header;
      errorMessage.value = null; // Clear any previous errors
      return header; // Return the fetched data
    } catch (e) {
      errorMessage.value = e.toString(); // Set error message
      print('Error fetching restaurant header: $e');
      return null; // Return null to indicate error
    }
  }
}