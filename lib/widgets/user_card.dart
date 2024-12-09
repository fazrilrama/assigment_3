import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final int id;
  final String name;
  final String username;
  final String email;
  final Map<String, dynamic> address;
  final String phone;
  final String website;
  final Map<String, dynamic> company;

  const UserCard({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
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
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Email: $email",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Phone: $phone",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Website: $website",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
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