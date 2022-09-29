import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:galeria/Models/Model_Gifs.dart';

class GifProvider {  
  Future<List<ModelGifs>> getGifs(int offset) async {
    String Url =
      "http://api.giphy.com/v1/gifs/trending?offset=${offset}&api_key=DRUj8CKKvqFL34oY3q8GIC65rzPOLX4O&limit=10";
    final response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final json = jsonDecode(body);
      final gif = Gif.fromJsonList(json);
      return gif.items;
    } else {
      throw Exception("Fallo al cargar los gifs");
    }
  }
}
