import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelp {
  NetworkHelp(this.url);

  String url;

  Future getData() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
