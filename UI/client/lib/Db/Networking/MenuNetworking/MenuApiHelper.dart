import 'dart:convert';
import 'dart:io';

import 'package:flutter_eats/Db/Constants.dart';
import 'package:http/http.dart' as http;

import 'MenuException.dart';

class ApiHelper {
  String baseURl ="https://restuarant-side.herokuapp.com/restaurant";
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(baseURl + url);
      responseJson = _returnResponse(response);
    } on SocketException {}
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      default:
        throw MenuFetchDataException('Error occurred ${response.statusCode}');
    }
  }
}