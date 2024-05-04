class User {
  final String id;
  final String firstname;
  final String lastname;
  final String email;

  User({required this.id, required this.firstname, required this.lastname, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
    );
  }
}
