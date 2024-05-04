import 'package:flutter/material.dart';
import 'package:turistear/tourist_service.dart';

class DetailTouristScreen extends StatefulWidget {
  final int id;

  DetailTouristScreen({required this.id});

  @override
  _DetailTouristScreenState createState() => _DetailTouristScreenState();
}

class _DetailTouristScreenState extends State<DetailTouristScreen> {
  late Future<Map<String, dynamic>> touristDetails;

  @override
  void initState() {
    super.initState();
    touristDetails = TouristService.fetchTouristDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Sitio Turistico'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: touristDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(snapshot.data?['title']),
                  AspectRatio(
                    aspectRatio: 1.0, // Ajusta la relación de aspecto según sea necesario
                    child: Image.network(snapshot.data?['image'], fit: BoxFit.cover),
                  ),
                  SizedBox(height: 10),
                  Text('Direccion: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(snapshot.data?['address']),
                  SizedBox(height: 5),
                  Text('Descripción: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(snapshot.data?['tur_description']),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}


