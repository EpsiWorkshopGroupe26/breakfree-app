import 'package:breakfree/models/addiction_model.dart';
import 'package:breakfree/models/emotion_model.dart';
import 'package:breakfree/models/general_information.dart';
import 'package:breakfree/models/mantal_health.dart';
import 'package:breakfree/models/motivation_model.dart';

class User {
  final int id;
  final String email;
  final String? password; // Nullable car non sérialisé lors de la récupération
  final GeneralInformation? generalInformation;
  final List<Addiction>? addictions;
  final List<Emotion>? emotions;
  final List<MentalHealth>? mentalHealths;
  final List<Motivation>? motivations;
  final DateTime createdAt;
  final DateTime? updatedAt;

  User({
    required this.id,
    required this.email,
    this.password,
    this.generalInformation,
    this.addictions,
    this.emotions,
    this.mentalHealths,
    this.motivations,
    required this.createdAt,
    this.updatedAt,
  });

  // Constructeur à partir d'un JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      email: json['email'] as String,
      // Le mot de passe n'est généralement pas retourné par l'API
      password: json['password'] as String?,
      generalInformation: json['generalInformation'] != null
          ? GeneralInformation.fromJson(json['generalInformation'])
          : null,
      addictions: json['addictions'] != null
          ? (json['addictions'] as List<dynamic>)
              .map((item) => Addiction.fromJson(item))
              .toList()
          : null,
      emotions: json['emotions'] != null
          ? (json['emotions'] as List<dynamic>)
              .map((item) => Emotion.fromJson(item))
              .toList()
          : null,
      mentalHealths: json['mentalHealths'] != null
          ? (json['mentalHealths'] as List<dynamic>)
              .map((item) => MentalHealth.fromJson(item))
              .toList()
          : null,
      motivations: json['motivations'] != null
          ? (json['motivations'] as List<dynamic>)
              .map((item) => Motivation.fromJson(item))
              .toList()
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Méthode pour convertir l'objet en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      // Inclure le mot de passe uniquement si nécessaire (par exemple, lors de la création)
      if (password != null) 'password': password,
      'generalInformation': generalInformation?.toJson(),
      'addictions': addictions?.map((addiction) => addiction.toJson()).toList(),
      'emotions': emotions?.map((emotion) => emotion.toJson()).toList(),
      'mentalHealths': mentalHealths?.map((mh) => mh.toJson()).toList(),
      'motivations':
          motivations?.map((motivation) => motivation.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
