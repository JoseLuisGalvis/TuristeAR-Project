import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turistear/register_screen.dart';
import 'authviewmodel.dart';
import 'login_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthViewModel(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TuristeAR',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text('TuristeAR',
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
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(), // Navegacion
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.lightGreenAccent,
            ),
            child: const Icon(
              Icons.lock,
              color: Colors.white,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomAppBar(
        elevation: 10,
        color: Colors.lightGreenAccent,
        shape: CircularNotchedRectangle(),
        height: 55,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/fondo.png',
            fit: BoxFit.cover,
            // color: Colors.blue.withOpacity(0.6),
            // colorBlendMode: BlendMode.color,
          ),
        ],
      ),
    );
  }
}