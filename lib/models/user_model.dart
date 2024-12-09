class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final Map<String, dynamic> address;
  final String phone;
  final String website;
  final Map<String, dynamic> company;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      website: json['website'],
      company: json['company'],
    );
  }

  @override
  String toString() {
    return '{id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company}';
  } 
}
