
import 'package:mongo_dart/mongo_dart.dart';

class User {
  final ObjectId id;
  final String email;
  final String? persona;

  User({required this.id, required this.email, this.persona});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        email: json['email'],
        persona: json['persona'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'email': email,
        'persona': persona,
      };
}
