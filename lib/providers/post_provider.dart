import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:app_assigment_3/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostProvider with ChangeNotifier {
  List<PostModel> _posts = [];

  // URL API
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  // Getter untuk mengambil data post
  List<PostModel> get posts => [..._posts];

  // Fetch data dari API
  Future<void> fetchPosts() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _posts = data.map((item) => PostModel.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load posts. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred: $error');
      rethrow;
    }
  }
}
