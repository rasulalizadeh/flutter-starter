import 'package:http/http.dart' as http;

var baseUrl = "https://raingate.ir";

Future<http.Response> getProducts() async {
  return http.get(Uri.parse("$baseUrl/api/products?page[number]=1&page[size]=10"));
}