// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  User(
      {required this.title,
      required this.url,
      required this.thumbnailUrl,
      required this.albumId,
      required this.id});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        id: parsedJson['id'],
        albumId: parsedJson['albumId'],
        title: parsedJson['title'],
        url: parsedJson['url'],
        thumbnailUrl: parsedJson['thumbnailUrl']);
  }
}
