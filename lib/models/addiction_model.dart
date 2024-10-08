class AddictionModel {
  final int? id;
  final String type;
  final String frequency;
  final String duration;
  final String consequences;
  final String weaning;
  final String lastUse;

  AddictionModel({
    this.id,
    required this.type,
    required this.frequency,
    required this.duration,
    required this.consequences,
    required this.weaning,
    required this.lastUse,
  });

  factory AddictionModel.fromJson(Map<String, dynamic> json) {
    return AddictionModel(
      id: json['id'],
      type: json['type'],
      frequency: json['frequency'],
      duration: json['duration'],
      consequences: json['consequences'],
      weaning: json['weaning'],
      lastUse: json['lastUse'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'frequency': frequency,
      'duration': duration,
      'consequences': consequences,
      'weaning': weaning,
      'lastUse': lastUse,
    };
  }
}
