import 'package:flutter/material.dart';

class TouristScreen extends StatefulWidget {
  @override
  _TouristScreenState createState() => _TouristScreenState();
}

class _TouristScreenState extends State<TouristScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text(
          'TuristeAR - Sitios Turísticos',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 5,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand, // Cambiado a tight para asegurar el ajuste
        children: [
          Image.asset(
            'assets/images/fondo.png',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Card(
                    margin: const EdgeInsets.all(8.0),
                    elevation: 20,
                    color: Colors.lightGreenAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ExpansionTile(
                          iconColor: Colors.white,
                          title: Text(
                            'Sitios Históricos',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Icon(Icons.history, color: Colors.white),
                          children: [
                            Container(
                              color: Colors.white,
                              child: Text('Plaza de Mayo'),
                            ),
                            Container(
                              color: Colors.white,
                              child: ListTile(
                                title: Text('Buenos Aires Obelisco'),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              child: ListTile(
                                title: Text('Puerto Madero'),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              child: ListTile(
                                title: Text('La Boca'),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              child: ListTile(
                                title: Text('Palacio Barolo'),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
