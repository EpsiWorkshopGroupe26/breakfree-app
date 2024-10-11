// emotion.dart

import 'package:breakfree/models/user_model.dart';

class Emotion {
  final int id;
  final int userId;
  final String states;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User? user;

  Emotion({
    required this.id,
    required this.userId,
    required this.states,
    required this.createdAt,
    required this.updatedAt,
    this.user,
  });

  // Constructeur à partir d'un JSON
  factory Emotion.fromJson(Map<String, dynamic> json) {
    return Emotion(
      id: json['id'] as int,
      userId: json['userId'] as int,
      states: json['states'] as String,
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
      'states': states,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'user': user?.toJson(),
    };
  }
}
