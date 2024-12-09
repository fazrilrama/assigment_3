
import 'dart:convert';

import 'package:app_assigment_3/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  List<UserModel> _users = [];

  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  List<UserModel> get users {
    return [..._users];
  }

  Future<void> fetchUsers() async {
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _users = data.map((user) => UserModel.fromJson(user)).toList();
        notifyListeners(); 
      } else {
        throw Exception('Failed to load posts. Status code: ${response.statusCode}');
      }
    } catch(error) {
      print('Error occurred: $error');
      rethrow;
    }
  }
}