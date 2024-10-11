// lib/services/addiction_service.dart

import 'dart:convert';
import 'package:breakfree/models/addiction_model.dart';
import 'package:dio/dio.dart';
import 'api_client.dart';

class AddictionService {
  final Dio _dio = ApiClient().dio;

  // Récupérer toutes les addictions
  Future<List<Addiction>> getAddictions() async {
    try {
      final response = await _dio.get('/addictions/shows');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((item) => Addiction.fromJson(item)).toList();
      } else {
        throw Exception('Échec du chargement des addictions');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors du chargement des addictions');
    }
  }

  // Récupérer une addiction spécifique par ID
  Future<Addiction> getAddiction(int id) async {
    try {
      final response = await _dio.get('/addictions/show/$id');

      if (response.statusCode == 200) {
        return Addiction.fromJson(response.data['data']);
      } else {
        throw Exception('Échec du chargement de l\'addiction');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors du chargement de l\'addiction');
    }
  }

  // Créer une nouvelle addiction
  Future<Addiction> createAddiction(Addiction addiction) async {
    try {
      final response =
          await _dio.post('/addictions/create', data: addiction.toJson());

      if (response.statusCode == 201) {
        return Addiction.fromJson(response.data['data']);
      } else {
        throw Exception('Échec de la création de l\'addiction');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la création de l\'addiction');
    }
  }

  // Mettre à jour une addiction existante
  Future<Addiction> updateAddiction(int id, Addiction addiction) async {
    try {
      final response =
          await _dio.put('/addictions/update/$id', data: addiction.toJson());

      if (response.statusCode == 200) {
        return Addiction.fromJson(response.data['data']);
      } else {
        throw Exception('Échec de la mise à jour de l\'addiction');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la mise à jour de l\'addiction');
    }
  }

  // Supprimer une addiction
  Future<void> deleteAddiction(int id) async {
    try {
      final response = await _dio.delete('/addictions/delete/$id');

      if (response.statusCode != 200) {
        throw Exception('Échec de la suppression de l\'addiction');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la suppression de l\'addiction');
    }
  }
}
