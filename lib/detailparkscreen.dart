import 'package:flutter/material.dart';

import 'museum_service.dart';


class DetailParkScreen extends StatefulWidget {
  final int id;

  DetailParkScreen({required this.id});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailParkScreen> {
  late Future<Map<String, dynamic>> museumDetails;

  @override
  void initState() {
    super.initState();
    museumDetails = MuseumService.fetchMuseumDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Museo'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: museumDetails,
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
                  Image.network(snapshot.data?['image']),
                  Text(snapshot.data?['address']),
                  Text(snapshot.data?['museumdescription']),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

