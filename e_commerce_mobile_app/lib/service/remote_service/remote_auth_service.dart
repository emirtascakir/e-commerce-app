import 'dart:convert';

import 'package:e_commerce_mobile_app/constant/constant.dart';
import 'package:http/http.dart' as http;

class RemoteAuthService {
  final client = http.Client();

  Future<dynamic> signUp(
      {required String email, required String password}) async {
    final body = {'username': email, 'email': email, 'password': password};
    final response = await client.post(
        Uri.parse('$baseUrl/api/auth/local/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body));
    return response;
  }

  Future<dynamic> createProfile(
      {required String fullName, required String token}) async {
    await client.post(Uri.parse('$baseUrl/api/profile/me'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }

  Future<dynamic> signIn(
      {required String email, required String password}) async {
    final body = {'identifier': email, 'password': password};
    final response = await client.post(Uri.parse('$baseUrl/api/auth/local'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(body));
    return response;
  }

  Future<dynamic> getProfile({required String token}) async {
    await client.get(Uri.parse('$baseUrl/api/profile/me'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }
}
