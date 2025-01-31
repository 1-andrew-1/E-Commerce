import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductApi {
  final url = Uri.parse('https://fakestoreapi.com/products');
  getProducts() async {
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error getting products: $e');
      return [];
    }
  }
}
