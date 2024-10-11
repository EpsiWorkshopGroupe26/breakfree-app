import 'dart:convert';
import 'package:breakfree/models/user_model.dart';
import 'package:dio/dio.dart';
import 'api_client.dart';

class AuthService {
  final Dio _dio = ApiClient().dio;

  // Inscription
  Future<User> register(String email, String password) async {
    try {
      final response = await _dio.post('/auth/register', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 201) {
        // Supposons que l'API retourne le token et les informations utilisateur
        String token = response.data['token']['token'];
        User user = User.fromJson(response.data['user']);

        // Mettre à jour le token dans ApiClient
        await ApiClient().updateToken(token);
        await ApiClient().updateUserId(user.id);

        return user;
      } else {
        throw Exception('Échec de l\'inscription');
      }
    } on DioException catch (e) {
      // Gérer les erreurs spécifiques de Dio ici
      throw Exception(e.response?.data['message'] ?? 'Erreur d\'inscription');
    }
  }

  // Connexion
  Future<User> login(String email, String password) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        String token = response.data['token'];
        User user = User.fromJson(response.data['user']);

        // Mettre à jour le token dans ApiClient
        await ApiClient().updateToken(token);
        await ApiClient().updateUserId(user.id);

        return user;
      } else {
        throw Exception('Échec de la connexion');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Erreur de connexion');
    }
  }

  // Déconnexion
  Future<void> logout() async {
    try {
      final response = await _dio.post('/auth/logout');

      if (response.statusCode == 200) {
        // Supprimer le token de ApiClient
        await ApiClient().deleteToken();
        await ApiClient().deleteUserId();
      } else {
        throw Exception('Échec de la déconnexion');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Erreur de déconnexion');
    }
  }

  // Suppression de l'utilisateur
  Future<void> deleteUser() async {
    try {
      final response = await _dio.delete('/auth/user/delete');

      if (response.statusCode == 200) {
        // Supprimer le token de ApiClient
        await ApiClient().deleteToken();
        await ApiClient().deleteUserId();
      } else {
        throw Exception('Échec de la suppression de l\'utilisateur');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Erreur de suppression');
    }
  }

  // check if user is authenticated
  Future<AuthStatus> isAuthenticated() async {
    try {
      final response = await _dio.get('/userInfos/show');

      if (response.statusCode == 200) {
        return AuthStatus.setup;
      } else if (response.statusCode == 500) {
        return AuthStatus.authenticated;
      } else {
        return AuthStatus.unauthenticated;
      }
    } on DioException catch (e) {
      return AuthStatus.unauthenticated;
    }
  }
}

enum AuthStatus { authenticated, unauthenticated, setup }
