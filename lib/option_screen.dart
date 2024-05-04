import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:turistear/parkscreen.dart';
import 'package:turistear/touristscreen.dart';

import 'historicalscreen.dart';
import 'main.dart';
import 'museumscreen.dart';

class OptionScreen extends StatefulWidget {
  @override
  _OptionScreenState createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text(
          'TuristeAR - Opciones ',
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(32),
                      children: [
                        Card(
                          color: Colors.lightGreen,
                          elevation: 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 8),
                                  Icon(Icons.museum, color: Colors.white),
                                  Text(
                                    'Museos',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black,
                                          blurRadius: 5,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.forward,
                                        color: Colors.white),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MuseumScreen()),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          color: Colors.lightGreenAccent,
                          elevation: 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 8),
                                  Icon(Icons.park, color: Colors.white),
                                  Text(
                                    'Parques',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black,
                                          blurRadius: 5,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.forward,
                                        color: Colors.white),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ParkScreen()),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          color: Colors.lightGreenAccent,
                          elevation: 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 8),
                                  Icon(Icons.place,
                                      color: Colors
                                          .white), // Icono alusivo al título
                                  Text(
                                    'Atracciones\n Turísticas',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black,
                                          blurRadius: 5,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.forward,
                                        color: Colors.white),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => TouristScreen()),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          color: Colors.lightGreen,
                          elevation: 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 8),
                                  Icon(Icons.history,
                                      color: Colors
                                          .white), // Icono alusivo al título

                                  Text(
                                    'Sitios\n Históricos',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black,
                                          blurRadius: 5,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.forward,
                                        color: Colors.white),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HistoricalScreen()),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 480,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 10,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 50,
                          child: Text(
                            'Opciones',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 5,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Colors.lightGreenAccent,
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.date_range, color: Colors.white),
                                Text(
                                  'Fecha',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 5,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.lightGreenAccent,
                            onPressed: () {
                              // Mostrar hora
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Hora',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 5,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.lightGreenAccent,
                            onPressed: () {
                              // Mostrar calendario
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: Container(
                                      height: 400,
                                      child: SfCalendar(
                                        view: CalendarView.month,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Calend.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 5,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
