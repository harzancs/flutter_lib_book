import 'dart:convert';

import 'package:flutter_lib_book/view/load_more/model/list.dart';
import 'package:http/http.dart' as http;

// List<Photo> parsePhotos(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

//   return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
// }

Future<String> fetchData() async {
  final response = await http.get(
      'https://appworksite.com/work/app_api_ios_v2/mainList?uid=9&start=0&rows=4');

  if (response.statusCode == 200) {
// If server returns an OK response, parse the JSON.
    String data = json.decode(response.body) as String;
    print(data);
    return data.toString();
  } else {
// If that response was not OK, throw an error.
    throw Exception('Failed to load Stocks');
  }
}
