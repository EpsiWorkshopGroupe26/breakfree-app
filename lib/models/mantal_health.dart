// mental_health.dart

import 'package:breakfree/models/user_model.dart';

class MentalHealth {
  final int id;
  final int userId;
  final bool symptoms;
  final int stress;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User? user;

  MentalHealth({
    required this.id,
    required this.userId,
    required this.symptoms,
    required this.stress,
    required this.createdAt,
    required this.updatedAt,
    this.user,
  });

  // Constructeur à partir d'un JSON
  factory MentalHealth.fromJson(Map<String, dynamic> json) {
    return MentalHealth(
      id: json['id'] as int,
      userId: json['userId'] as int,
      symptoms: json['symptoms'] as bool,
      stress: json['stress'] as int,
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
      'symptoms': symptoms,
      'stress': stress,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'user': user?.toJson(),
    };
  }
}
