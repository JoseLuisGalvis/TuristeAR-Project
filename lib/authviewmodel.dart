import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'api_service.dart';

class UserApp {
  final String id;
  final String email;
  final String firstname;
  final String lastname;

  UserApp({this.id = '', this.email = '', this.firstname = '', this.lastname = ''});

  // Método para convertir un objeto JSON en un objeto UserApp
  factory UserApp.fromJson(Map<String, dynamic> json) {
    return UserApp(
      id: json['id'].toString(),
      email: json['email'],
      firstname: json['firstname'],
      lastname: json['lastname'],
    );
  }
}

class AuthViewModel extends ChangeNotifier {
  UserApp _currentUser = UserApp();
  SharedPreferences? _prefs;

  void updateCurrentUser(String id, String email, String firstname, String lastname) {
    _currentUser = UserApp(id: id, email: email, firstname: firstname, lastname: lastname);
    notifyListeners();
  }

  void updateUserFromSharedPreferences() async {
    UserApp? user = await _apiService.getLoggedInUser();
    if (user != null) {
      _currentUser = user;
      notifyListeners();
    }
  }

  AuthViewModel() {
    _init();
  }


  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  UserApp get currentUser => _currentUser;

  final ApiService _apiService = ApiService();
  String apiEndpoint = '';

  Future<bool> registerUser(String id, String firstname, String lastname, String email, String password) async {
    try {
      apiEndpoint = '/registerUser';
      final response = await http.post(
        Uri.parse('http://localhost:2100$apiEndpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'id': id,
          'firstname': firstname,
          'lastname': lastname,
          'email': email,
          'password': password,
        }),
      );

      print("Datos enviados a la API: $id, $firstname, $lastname, $email");
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        print("Usuario registrado correctamente");
        return true; // Usuario registrado correctamente
      } else {
        print("Error al registrar usuario. Código de estado: ${response.statusCode}");
        return false; // Error al registrar usuario
      }
    } catch (e) {
      print('Error al hacer la solicitud de registro: $e');
      return false;
    }
  }

  Future<bool> loginUser(String id, String email, String password) async {
    apiEndpoint = '/loginUser';
    print("Datos recibidos para inicio de sesión: $email, $password");
    try {
      final response = await http.post(Uri.parse('http://localhost:2100$apiEndpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'id': id.toString(),
          'email': email,
          'password': password,
        }),
      );

      print("Datos enviados a la API: $email, $password");
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        // Decodificar la respuesta JSON
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        String id = jsonResponse['id'].toString();
        String email = jsonResponse['email'] ?? '';
        String firstname = jsonResponse['firstname'] ?? '';
        String lastname = jsonResponse['lastname'] ?? '';

        // Almacenar los datos del usuario en SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('id', id);
        await prefs.setString('email', email);
        await prefs.setString('firstname', firstname);
        await prefs.setString('lastname', lastname);

        print("Usuario autenticado correctamente");
        _currentUser = UserApp( // Actualiza el estado del usuario
          id: id,
          email: email,
          firstname: firstname,
          lastname: lastname,
        );

        notifyListeners(); // Notifica a los widgets que escuchan este modelo de que el estado ha cambiado
        return true; // Usuario registrado correctamente
      } else {
        print("Error al iniciar sesión. Código de estado: ${response.statusCode}");
        return false; // Error al iniciar sesión
      }
    } catch (e) {
      print('Error al hacer la solicitud de inicio de sesión: $e');
      return false;
    }
  }
}








