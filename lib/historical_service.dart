import 'dart:convert';
import 'package:http/http.dart' as http;

class HistoricalService {
  static Future<Map<String, dynamic>> fetchHistoricalDetails(int id) async {
    final response = await http.get(Uri.parse('http://localhost:2100/historical/$id'));

    if (response.statusCode == 200) {
      // Asume que la respuesta es un arreglo y toma el primer elemento
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al cargar los detalles del Sitio Historico');
    }
  }
}
