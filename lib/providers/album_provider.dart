import 'dart:convert';

import 'package:app_assigment_3/models/album_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlbumProvider with ChangeNotifier {
  List<AlbumModel> _albums = [];  

  final url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
  List<AlbumModel> get albums {
    // ignore: recursive_getters
    return [..._albums];
  }

  Future<void> fetchAlbums() async {
    try {
      final response = await http.get(url);
      if(response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _albums = data.map((album) => AlbumModel.fromJson(album)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load albums');
      }
    } catch(err) {
      print('Error occurred: $err');
      rethrow;
    }
  }
}