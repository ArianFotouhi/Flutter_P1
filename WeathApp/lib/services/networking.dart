import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    Uri apiUrl = Uri.parse(url);

    http.Response response = await http.get(apiUrl);
    String data = response.body;
    return data;
  }
}
