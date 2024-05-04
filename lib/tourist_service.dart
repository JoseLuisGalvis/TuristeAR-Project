import 'dart:convert';
import 'package:http/http.dart' as http;

class TouristService {
  static Future<Map<String, dynamic>> fetchTouristDetails(int id) async {
    final response = await http.get(Uri.parse('http://localhost:2100/tourist/$id'));

    if (response.statusCode == 200) {
      // Asume que la respuesta es un arreglo y toma el primer elemento
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al cargar los detalles del Sitio Turistico');
    }
  }
}
