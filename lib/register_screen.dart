import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authviewmodel.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text(
          'TuristeAR - Registro',
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
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.8, // Establece el ancho al 60% del ancho de la pantalla
                    child: Card(
                      margin: const EdgeInsets.all(8.0),
                      elevation: 20,
                      color: Colors.lightGreenAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                TextFormField(
                                  controller: _firstnameController,
                                  decoration: InputDecoration(
                                      labelText: 'Nombre',
                                      labelStyle:
                                          TextStyle(color: Colors.black)),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor ingrese su nombre';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _lastnameController,
                                  decoration: InputDecoration(
                                      labelText: 'Apellido',
                                      labelStyle:
                                          TextStyle(color: Colors.black)),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor ingrese su apellido';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle:
                                          TextStyle(color: Colors.black)),
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
                                      labelStyle:
                                          TextStyle(color: Colors.black)),
                                  obscureText: true,
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
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Provider.of<AuthViewModel>(context,
                                              listen: false)
                                          .registerUser(
                                              '', // ID (puedes generar un ID o dejarlo vacío si tu API lo maneja)
                                              _firstnameController.text,
                                              _lastnameController.text,
                                              _emailController.text,
                                              _passwordController.text)
                                          .then((_) {
                                        // Limpia los campos del formulario
                                        _firstnameController.clear();
                                        _lastnameController.clear();
                                        _emailController.clear();
                                        _passwordController.clear();
                                      });
                                    }
                                  },
                                  child: Text('Registrarse'),
                                ),
                                SizedBox(height: 16),
                              ],
                            ),
                          ),
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
