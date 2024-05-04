import 'package:flutter/material.dart';

import 'detailscreen.dart';

class MuseumScreen extends StatefulWidget {
  @override
  _MuseumScreenState createState() => _MuseumScreenState();
}

class _MuseumScreenState extends State<MuseumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text(
          'TuristeAR - Museos',
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
                          'Museos',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(Icons.history, color: Colors.white),
                        children: [
                          Container(
                            color: Colors.white,
                            child: ListTile(
                              title:
                                  Text('Museo de Arte Latinoamericano (MALBA)'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(id: 1),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: ListTile(
                              title: Text('Museo Nacional de Bellas Artes'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(id: 2),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: ListTile(
                              title: Text('Museo de Arte Decorativo'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(id: 3),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: ListTile(
                              title: Text('Colección Fortabat'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(id: 4),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: ListTile(
                              title: Text('Museo Histórico Nacional'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(id: 5),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
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
