import 'package:breakfree/models/objective_model.dart';
import 'package:dio/dio.dart';
import 'api_client.dart';

class ObjectiveService {
  final Dio _dio = ApiClient().dio;

  // Récupérer toutes les objectifs
  Future<List<Objective>> getObjectives() async {
    try {
      final response = await _dio.get('/objectives/shows');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((item) => Objective.fromJson(item)).toList();
      } else {
        throw Exception('Échec du chargement des objectifs');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors du chargement des objectifs');
    }
  }

  // Récupérer un objectif spécifique par ID et Addiction ID
  Future<Objective> getObjective(int id, int addictionId) async {
    try {
      final response =
          await _dio.get('/objectives/show/$id/addiction/$addictionId');

      if (response.statusCode == 200) {
        return Objective.fromJson(response.data['data']);
      } else {
        throw Exception('Échec du chargement de l\'objectif');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors du chargement de l\'objectif');
    }
  }

  // Créer un nouvel objectif pour une addiction spécifique
  Future<Objective> createObjective(
      int addictionId, Objective objective) async {
    try {
      final response = await _dio.post('/objectives/create/$addictionId',
          data: objective.toJson());

      if (response.statusCode == 201) {
        return Objective.fromJson(response.data['data']);
      } else {
        throw Exception('Échec de la création de l\'objectif');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la création de l\'objectif');
    }
  }

  // Mettre à jour un objectif existant pour une addiction spécifique
  Future<Objective> updateObjective(
      int id, int addictionId, Objective objective) async {
    try {
      final response = await _dio.put(
          '/objectives/update/$id/addiction/$addictionId',
          data: objective.toJson());

      if (response.statusCode == 200) {
        return Objective.fromJson(response.data['data']);
      } else {
        throw Exception('Échec de la mise à jour de l\'objectif');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la mise à jour de l\'objectif');
    }
  }

  // Supprimer un objectif pour une addiction spécifique
  Future<void> deleteObjective(int id, int addictionId) async {
    try {
      final response =
          await _dio.delete('/objectives/delete/$id/addiction/$addictionId');

      if (response.statusCode != 200) {
        throw Exception('Échec de la suppression de l\'objectif');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la suppression de l\'objectif');
    }
  }
}
