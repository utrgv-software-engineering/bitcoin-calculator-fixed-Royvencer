import 'package:http/http.dart' as http;
import 'dart:convert';

class CoindeskAPI {
  static Future<Map<String, dynamic>> fetchBitcoinPrice(http.Client client) async {
    var url = Uri.parse('https://api.coindesk.com/v1/bpi/currentprice/usd.json');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception('Failed to load Bitcoin price');
    }
  }
}