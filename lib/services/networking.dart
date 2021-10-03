import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(@required this.url);

  final String url;

  Future getData() async {
    var url = Uri.parse(this.url);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future<bool> checkStatusCode() async {
    var url = Uri.parse(this.url);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
