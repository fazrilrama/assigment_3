class AlbumModel {
  final int id;
  final String title;
  final int userId;

  AlbumModel({
    required this.id,
    required this.title,
    required this.userId
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      id: json['id'],
      title: json['title'],
      userId: json['userId']
    );
  }

  @override
  String toString() {
    return '{id: $id, title: $title, userId: $userId}';
  } 
}