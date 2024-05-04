import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

import 'authviewmodel.dart';

class ApiService {
  String apiEndpoint = '';

  Future<bool> registerUser(String firstname, String lastname, String email, String password) async {
    apiEndpoint = '/registerUser'; // Asumiendo que hay una ruta genérica para el registro

    final requestData = jsonEncode(<String, String>{
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password
    });

    final response = await http.post(
      Uri.parse('http://localhost:2100$apiEndpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: requestData,
    );

    if (response.statusCode == 200) {
      // Almacenar los datos del usuario en SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('firstname', firstname);
      await prefs.setString('lastname', lastname);
      await prefs.setString('email', email);

      return true;
    } else {
      return false;
    }
  }

  Future<bool> loginUser(String email, String password) async {
    apiEndpoint = '/loginUser'; // Asumiendo que hay una ruta genérica para el inicio de sesión
    String? baseUrl;

    // Determinar la dirección base según el emulador
    if (Platform.isAndroid) {
      baseUrl = 'http://127.0.0.1:2100';
    } else if (Platform.isIOS) {
      baseUrl = 'http://localhost:2100';
    }

    final requestData = jsonEncode(<String, String>{
      'email': email,
      'password': password,
    });

    final response = await http.post(
      Uri.parse('$baseUrl$apiEndpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: requestData,
    );

    if (response.statusCode == 200) {
      // Almacenar los datos del usuario en SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);

      return true;
    } else {
      return false;
    }
  }

  Future<UserApp?> getLoggedInUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? firstname = prefs.getString('firstname');
    String? lastname = prefs.getString('lastname');
    String? email = prefs.getString('email');

    if (firstname == null || lastname == null || email == null) {
      return null;
    }

    UserApp user = UserApp(firstname: firstname, lastname: lastname, email: email);
    return user;
  }
}

