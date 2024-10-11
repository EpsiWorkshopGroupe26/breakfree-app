import 'package:breakfree/models/general_information.dart';
import 'package:dio/dio.dart';
import 'api_client.dart';

class GeneralInformationService {
  final Dio _dio = ApiClient().dio;

  Future<GeneralInformation> getUserInfo() async {
    try {
      final response = await _dio.get('/userInfos/show');

      if (response.statusCode == 200) {
        return GeneralInformation.fromJson(response.data['data']);
      } else {
        throw Exception('Échec du chargement des informations générales');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors du chargement des informations générales');
    }
  }

  // Créer des informations générales pour l'utilisateur
  Future<GeneralInformation> createUserInfo(GeneralInformation info) async {
    try {
      final response =
          await _dio.post('/userInfos/create', data: info.toJson());

      if (response.statusCode == 201) {
        return GeneralInformation.fromJson(response.data['data']);
      } else {
        throw Exception('Échec de la création des informations générales');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la création des informations générales');
    }
  }

  // Mettre à jour les informations générales de l'utilisateur
  Future<GeneralInformation> updateUserInfo(
      int id, GeneralInformation info) async {
    try {
      final response =
          await _dio.put('/userInfos/update/$id', data: info.toJson());

      if (response.statusCode == 200) {
        return GeneralInformation.fromJson(response.data['data']);
      } else {
        throw Exception('Échec de la mise à jour des informations générales');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la mise à jour des informations générales');
    }
  }

  // Supprimer les informations générales de l'utilisateur
  Future<void> deleteUserInfo(int id) async {
    try {
      final response = await _dio.delete('/userInfos/delete/$id');

      if (response.statusCode != 200) {
        throw Exception('Échec de la suppression des informations générales');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Erreur lors de la suppression des informations générales');
    }
  }
}
