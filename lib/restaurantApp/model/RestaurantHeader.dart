import 'package:restaurant_app/restaurantApp/model/Restaurant.dart';

class RestaurantHeader {
  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;

  RestaurantHeader(
      {required this.error,
      required this.message,
      required this.count,
      required this.restaurants});

  factory RestaurantHeader.fromJson(Map<String, dynamic> json) {
    return RestaurantHeader(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: (json["restaurants"] as List)
        .map((restaurantJson) => Restaurant.fromJson(restaurantJson))
        .toList(),
    );
  }
}
