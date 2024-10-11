// lib/services/mental_health_service.dart

import 'dart:convert';
import 'package:breakfree/models/mantal_health.dart';
import 'package:dio/dio.dart';
import 'api_client.dart';

class MentalHealthService {
  final Dio _dio = ApiClient().dio;

  // Récupérer toutes les fiches de santé mentale
  Future<List<MentalHealth>> getMentalHealths() async {
    try {
      final response = await _dio.get('/mentalHealths/shows');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((item) => MentalHealth.fromJson(item)).toList();
      } else {
        throw Exception('Échec du chargement des fiches de santé mentale');
      }
    } on DioError catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors du chargement des fiches de santé mentale');
    }
  }

  // Récupérer une fiche de santé mentale spécifique par ID
  Future<MentalHealth> getMentalHealth(int id) async {
    try {
      final response = await _dio.get('/mentalHealths/show/$id');

      if (response.statusCode == 200) {
        return MentalHealth.fromJson(response.data['data']);
      } else {
        throw Exception('Échec du chargement de la fiche de santé mentale');
      }
    } on DioError catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors du chargement de la fiche de santé mentale');
    }
  }

  // Créer une nouvelle fiche de santé mentale
  Future<MentalHealth> createMentalHealth(MentalHealth mentalHealth) async {
    try {
      final response =
          await _dio.post('/mentalHealths/create', data: mentalHealth.toJson());

      if (response.statusCode == 201) {
        return MentalHealth.fromJson(response.data['data']);
      } else {
        throw Exception('Échec de la création de la fiche de santé mentale');
      }
    } on DioError catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la création de la fiche de santé mentale');
    }
  }

  // Mettre à jour une fiche de santé mentale existante
  Future<MentalHealth> updateMentalHealth(
      int id, MentalHealth mentalHealth) async {
    try {
      final response = await _dio.put('/mentalHealths/update/$id',
          data: mentalHealth.toJson());

      if (response.statusCode == 200) {
        return MentalHealth.fromJson(response.data['data']);
      } else {
        throw Exception('Échec de la mise à jour de la fiche de santé mentale');
      }
    } on DioError catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la mise à jour de la fiche de santé mentale');
    }
  }

  // Supprimer une fiche de santé mentale
  Future<void> deleteMentalHealth(int id) async {
    try {
      final response = await _dio.delete('/mentalHealths/delete/$id');

      if (response.statusCode != 200) {
        throw Exception('Échec de la suppression de la fiche de santé mentale');
      }
    } on DioError catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la suppression de la fiche de santé mentale');
    }
  }
}
