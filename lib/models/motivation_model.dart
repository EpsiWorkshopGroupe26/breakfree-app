// motivation.dart

import 'package:breakfree/models/user_model.dart';

class Motivation {
  final int id;
  final int userId;
  final String goal;
  final String strategy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User? user;

  Motivation({
    required this.id,
    required this.userId,
    required this.goal,
    required this.strategy,
    required this.createdAt,
    required this.updatedAt,
    this.user,
  });

  // Constructeur à partir d'un JSON
  factory Motivation.fromJson(Map<String, dynamic> json) {
    return Motivation(
      id: json['id'] as int,
      userId: json['userId'] as int,
      goal: json['goal'] as String,
      strategy: json['strategy'] as String,
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
      'goal': goal,
      'strategy': strategy,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'user': user?.toJson(),
    };
  }
}
