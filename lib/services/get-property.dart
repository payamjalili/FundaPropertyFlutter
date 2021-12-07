import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:funda_property_flutter/constants.dart';
import 'package:funda_property_flutter/models/property.dart';

Future<Property> fetchProperty() async {
  final url =
      '$baseURL/json/detail/ac1b0b1572524640a0ecc54de453ea9f/koop/e50c4ee3-1cf3-4e1d-bb81-60b23d28cb3a/';

  final response = await http.get(Uri.parse(url));

  print(response.statusCode);
  if (response.statusCode == 200) {
    return Property.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Property');
  }
}
