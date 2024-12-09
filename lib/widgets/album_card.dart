
import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  final int id;
  final String title;
  final int userId;

  const AlbumCard({super.key, 
    required this.id,
    required this.title,
    required this.userId,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text('User ID: $userId'),
        trailing: Text('ID: $id'),
      ),
    );
  } 
}