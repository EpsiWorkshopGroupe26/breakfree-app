// general_information.dart

import 'package:breakfree/models/user_model.dart';

class GeneralInformation {
  final int? id;
  final int userId;
  final String firstName;
  final String name;
  final int age;
  final String genre;
  final String situation;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User? user;

  GeneralInformation({
    this.id,
    required this.userId,
    required this.firstName,
    required this.name,
    required this.age,
    required this.genre,
    required this.situation,
    required this.createdAt,
    required this.updatedAt,
    this.user,
  });

  // Constructeur à partir d'un JSON
  factory GeneralInformation.fromJson(Map<String, dynamic> json) {
    return GeneralInformation(
      id: json['id'] as int,
      userId: json['userId'] as int,
      firstName: json['firstName'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      genre: json['genre'] as String,
      situation: json['situation'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  // Méthode pour convertir l'objet en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'firstName': firstName,
      'name': name,
      'age': age,
      'genre': genre,
      'situation': situation,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'user': user?.toJson(),
    };
  }
}
