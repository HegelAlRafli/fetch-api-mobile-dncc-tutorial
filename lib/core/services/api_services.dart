import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_fetch_api_dncc/home/model/restaurants_model.dart';

class ApiServices {
  // base API
  static String url = "https://restaurant-api.dicoding.dev/";

  // fetch list restaurant
  static Future<RestaurantModel> fetchRestaurant() async {
    // minta response ke API dengan endpoint /list
    final response = await http.get(Uri.parse("$url/list"));

    // response succes
    if (response.statusCode == 200) {
      // decode dari response
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      print(response.statusCode);
      return RestaurantModel.fromJson(jsonData);
    } else {
      throw Exception("Failed to load restaurant");
    }
  }
}
