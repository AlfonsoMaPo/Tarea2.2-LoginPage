import 'package:flutter/material.dart';
import 'package:myapp/Widget/costume_input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _login() {
    if (emailController.text == 'tu.correo@unah.edu.hn' &&
        passwordController.text == '12345678') {
      Navigator.pushReplacementNamed(context, '/home', arguments: emailController.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Credenciales incorrectas')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio de Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomInput(
                title: 'Correo',
                emailController: emailController,
                ocupalengthmax: true,
                length: 10,
                icon:const Icon(Icons.email),
                ),
            CustomInput(
                title: 'Contraseña',
                emailController: passwordController,
                keyboardType: TextInputType.visiblePassword,
                ocupalengthmax: false,
                icon:const Icon(Icons.lock)
                ),

            
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Iniciar Sesión'),
            ),
            TextButton(
              onPressed: () {
                // Navegar a la pantalla de registro
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
