import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final int id;
  final String title;
  final String body;
  final int userId;

  const PostCard({super.key,  
    required this.id, 
    required this.title, 
    required this.body, 
    required this.userId
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 140,
                padding: const EdgeInsets.all(0),
                child: Image.network(
                  "https://www.fmicassets.com/Damroot/GuitarVertDesktopJpg/10001/0113902719_fen_ins_frt_1_rr.jpg",
                  scale: 0.2,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                    Text(
                      body,
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                    const Text(
                      'Test',
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}