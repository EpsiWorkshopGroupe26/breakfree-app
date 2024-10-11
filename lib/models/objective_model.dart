import 'package:breakfree/models/addiction_model.dart';

class Objective {
  final int id;
  final int addictionId;
  final String description;
  final int evolution;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Addiction addiction;

  Objective({
    required this.id,
    required this.addictionId,
    required this.description,
    required this.evolution,
    required this.createdAt,
    required this.updatedAt,
    required this.addiction,
  });

  // Constructeur à partir d'un JSON
  factory Objective.fromJson(Map<String, dynamic> json) {
    return Objective(
      id: json['id'] as int,
      addictionId: json['addictionId'] as int,
      description: json['description'] as String,
      evolution: json['evolution'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      addiction: Addiction.fromJson(json['addiction'] as Map<String, dynamic>),
    );
  }

  // Méthode pour convertir l'objet en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'addictionId': addictionId,
      'description': description,
      'evolution': evolution,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'addiction': addiction.toJson(),
    };
  }
}
