import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turistear/register_screen.dart';

import 'authviewmodel.dart';
import 'main.dart';
import 'option_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText =
      true; // Variable para controlar la visibilidad de la contraseña

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text(
          'TuristeAR - Login ',
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
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/fondo.png',
            fit: BoxFit.cover,
            // color: Colors.blue.withOpacity(0.6),
            // colorBlendMode: BlendMode.color,
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
                    child: Form(
                      key: _formKey,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.all(32.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(labelText: 'Email'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingrese su email';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Contraseña',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                              obscureText: _obscureText,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingrese su contraseña';
                                }
                                return null;
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(20),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(Size(
                                    MediaQuery.of(context).size.width * 0.6,
                                    40)),
                                backgroundColor: MaterialStateProperty
                                    .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.hovered)) {
                                      return Colors
                                          .lightGreen; // Color de fondo al hover
                                    }
                                    return Colors
                                        .lightGreenAccent; // Color de fondo normal
                                  },
                                ),
                                foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.hovered)) {
                                      return Colors.white; // Cambia a blanco al hover
                                    }
                                    return Colors.white;  // Blanco en todo momento
                                  },
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // Muestra un indicador de carga
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Iniciando sesión...'),
                                          CircularProgressIndicator(),
                                        ],
                                      ),
                                      duration: Duration(
                                          seconds:
                                              10), // Ajusta la duración según sea necesario
                                    ),
                                  );

                                  bool loginSuccess =
                                      await Provider.of<AuthViewModel>(context,
                                              listen: false)
                                          .loginUser(
                                    '', // ID (puedes generar un ID o dejarlo vacío si tu API lo maneja)
                                    _emailController.text,
                                    _passwordController.text,
                                  );

                                  // Oculta el indicador de carga
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();

                                  if (loginSuccess) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OptionScreen()),
                                    );
                                  } else {
                                    // Muestra un mensaje de error
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('Error al iniciar sesión'),
                                          backgroundColor: Colors.red),
                                    );
                                  }
                                }
                              },
                              child: Text('Iniciar Sesión'),
                            ),
                            SizedBox(
                                height: 16), // Agrega el espacio deseado aquí
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Si aún no te has registrado, hazlo ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black,
                                          blurRadius: 5,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen(), // Navegacion
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'AQUÍ',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
