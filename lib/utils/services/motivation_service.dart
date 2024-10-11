import 'package:breakfree/models/motivation_model.dart';
import 'package:dio/dio.dart';
import 'api_client.dart';

class MotivationService {
  final Dio _dio = ApiClient().dio;

  // Récupérer toutes les motivations
  Future<List<Motivation>> getMotivations() async {
    try {
      final response = await _dio.get('/motivations/shows');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((item) => Motivation.fromJson(item)).toList();
      } else {
        throw Exception('Échec du chargement des motivations');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors du chargement des motivations');
    }
  }

  // Récupérer une motivation spécifique par ID
  Future<Motivation> getMotivation(int id) async {
    try {
      final response = await _dio.get('/motivations/show/$id');

      if (response.statusCode == 200) {
        return Motivation.fromJson(response.data['data']);
      } else {
        throw Exception('Échec du chargement de la motivation');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors du chargement de la motivation');
    }
  }

  // Créer une nouvelle motivation
  Future<Motivation> createMotivation(Motivation motivation) async {
    try {
      final response =
          await _dio.post('/motivations/create', data: motivation.toJson());

      if (response.statusCode == 201) {
        return Motivation.fromJson(response.data['data']);
      } else {
        throw Exception('Échec de la création de la motivation');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la création de la motivation');
    }
  }

  // Mettre à jour une motivation existante
  Future<Motivation> updateMotivation(int id, Motivation motivation) async {
    try {
      final response =
          await _dio.put('/motivations/update/$id', data: motivation.toJson());

      if (response.statusCode == 200) {
        return Motivation.fromJson(response.data['data']);
      } else {
        throw Exception('Échec de la mise à jour de la motivation');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la mise à jour de la motivation');
    }
  }

  // Supprimer une motivation
  Future<void> deleteMotivation(int id) async {
    try {
      final response = await _dio.delete('/motivations/delete/$id');

      if (response.statusCode != 200) {
        throw Exception('Échec de la suppression de la motivation');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la suppression de la motivation');
    }
  }
}
