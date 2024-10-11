import 'package:breakfree/models/objective_model.dart';

class Addiction {
  final int id;
  final int userId;
  final String type;
  final String frequency;
  final String duration;
  final String consequences;
  final String weaning;
  final List<Objective>? objectives;
  final DateTime createdAt;
  final DateTime updatedAt;

  Addiction({
    required this.id,
    required this.userId,
    required this.type,
    required this.frequency,
    required this.duration,
    required this.consequences,
    required this.weaning,
    this.objectives,
    required this.createdAt,
    required this.updatedAt,
  });

  // Constructeur à partir d'un JSON
  factory Addiction.fromJson(Map<String, dynamic> json) {
    return Addiction(
      id: json['id'] as int,
      userId: json['userId'] as int,
      type: json['type'] as String,
      frequency: json['frequency'] as String,
      duration: json['duration'] as String,
      consequences: json['consequences'] as String,
      weaning: json['weaning'] as String,
      objectives: json['objectives'] != null
          ? (json['objectives'] as List<dynamic>)
              .map((item) => Objective.fromJson(item))
              .toList()
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  // Méthode pour convertir l'objet en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'type': type,
      'frequency': frequency,
      'duration': duration,
      'consequences': consequences,
      'weaning': weaning,
      'objectives': objectives?.map((obj) => obj.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
