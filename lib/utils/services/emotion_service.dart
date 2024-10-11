import 'package:breakfree/models/emotion_model.dart';
import 'package:dio/dio.dart';
import 'api_client.dart';

class EmotionService {
  final Dio _dio = ApiClient().dio;

  // Récupérer toutes les émotions
  Future<List<Emotion>> getEmotions() async {
    try {
      final response = await _dio.get('/emotions/shows');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((item) => Emotion.fromJson(item)).toList();
      } else {
        throw Exception('Échec du chargement des émotions');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors du chargement des émotions');
    }
  }

  // Récupérer une émotion spécifique par ID
  Future<Emotion> getEmotion(int id) async {
    try {
      final response = await _dio.get('/emotions/show/$id');

      if (response.statusCode == 200) {
        return Emotion.fromJson(response.data['data']);
      } else {
        throw Exception('Échec du chargement de l\'émotion');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors du chargement de l\'émotion');
    }
  }

  // Créer une nouvelle émotion
  Future<Emotion> createEmotion(Emotion emotion) async {
    try {
      final response =
          await _dio.post('/emotions/create', data: emotion.toJson());

      if (response.statusCode == 201) {
        return Emotion.fromJson(response.data['data']);
      } else {
        throw Exception('Échec de la création de l\'émotion');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la création de l\'émotion');
    }
  }

  // Mettre à jour une émotion existante
  Future<Emotion> updateEmotion(int id, Emotion emotion) async {
    try {
      final response =
          await _dio.put('/emotions/update/$id', data: emotion.toJson());

      if (response.statusCode == 200) {
        return Emotion.fromJson(response.data['data']);
      } else {
        throw Exception('Échec de la mise à jour de l\'émotion');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la mise à jour de l\'émotion');
    }
  }

  // Supprimer une émotion
  Future<void> deleteEmotion(int id) async {
    try {
      final response = await _dio.delete('/emotions/delete/$id');

      if (response.statusCode != 200) {
        throw Exception('Échec de la suppression de l\'émotion');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la suppression de l\'émotion');
    }
  }
}
