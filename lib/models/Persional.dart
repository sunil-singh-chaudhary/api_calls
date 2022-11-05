// ignore_for_file: public_member_api_docs, sort_constructors_first
class Persional {
  final String firstName;
  final String email;
  final String image;
  Persional({
    required this.firstName,
    required this.email,
    required this.image,
  });

  factory Persional.fromJson(Map<String, dynamic> parsedJson) {
    return Persional(
        firstName: parsedJson['firstName'],
        email: parsedJson['email'],
        image: parsedJson['image']);
  }
}
