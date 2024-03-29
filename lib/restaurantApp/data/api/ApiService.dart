import 'dart:convert';

import 'package:restaurant_app/restaurantApp/model/RestaurantSearch.dart';

import '../../model/RestaurantDetail.dart';
import '../../model/RestaurantHeader.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "https://restaurant-api.dicoding.dev";

  Future<RestaurantHeader> getList() async {
    final response = await http.get(Uri.parse("${baseUrl}/list"));
    print("Log Neotica: ${response.body}");

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return RestaurantHeader.fromJson(jsonData);
    } else {
      throw Exception("Failed to load");
    }
  }
  
  Future<RestaurantDetail> getDetail(String id) async {
    final response = await http.get(Uri.parse("$baseUrl/detail/$id"));
    print("Log Neotica: ${response.body}");

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return RestaurantDetail.fromJson(jsonData);
    } else {
      throw Exception(("Failed to load"));
    }
  }

  Future<RestaurantSearch> getSearch(String query) async {
    final response = await http.get(Uri.parse("$baseUrl/search?q=$query"));
    print("Log Neotica: ${response.body}");

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return RestaurantSearch.fromJson(jsonData);
    } else {
      throw Exception(("Failed to load"));
    }
  }
}