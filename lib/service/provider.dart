import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

import 'package:http/http.dart';

class HttpProvider {
  final _header = {'Accept': '*/*', 'Content-Type': 'application/json'};
  getAPI({required String api}) async {
    var headersList = _header;
    var url = Uri.parse(api);
    var req = Request('GET', url);
    req.headers.addAll(headersList);
    var res = await req.send();
    final resBody = await res.stream.bytesToString();
    if (res.statusCode >= 200 && res.statusCode < 300) {
      //print(resBody);
    } else {
      //print(res.reasonPhrase);
    }
    var json = jsonDecode(resBody);
    return json;
  }

  Future<List<String?>> scrapeImageUrls(String url) async {
  // Send an HTTP GET request to the website
  final response = await get(Uri.parse(url));

  // Check if the request was successful
  if (response.statusCode == 200) {
    final document = parser.parse(response.body);
    final imgElements = document.getElementsByTagName('img');

    // Extract the image URLs from the <img> elements
    final imageUrls = imgElements.map((element) => element.attributes['src']).toList();

    return imageUrls;
  } else {
    throw Exception('Failed to scrape image URLs: ${response.statusCode}');
  }
}

}
