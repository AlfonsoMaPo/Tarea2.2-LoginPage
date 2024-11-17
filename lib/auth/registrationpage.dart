import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void _register() {
    if (nameController.text.length < 3 || nameController.text.length > 10) {
      print('Nombre debe tener entre 3 y 10 caracteres');
      return;
    }
    if (!emailController.text.endsWith('@unah.edu.hn') &&
        !emailController.text.endsWith('@unah.hn')) {
      print('Correo debe ser válido y terminar con unah.edu.hn o unah.hn');
      return;
    }
    if (phoneController.text.length != 8) {
      print('El teléfono debe tener 8 dígitos');
      return;
    }
    
    if (phoneController.text[0] != '3' || phoneController.text[0]!='9') {
    print('El teléfono debe comenzar con 3 o 9');
    return;
    }
    
    if (!RegExp(r'^(?=.*[A-Z])(?=.*[!@#\$&*~]).{8,}$')
        .hasMatch(passwordController.text)) {
    print(
          'La contraseña debe tener al menos 8 caracteres, una mayúscula y un carácter especial');
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      print('Las contraseñas no coinciden');
      return;
    }

    // Si todas las validaciones pasan
    print(
        'Registro exitoso: ${nameController.text}, ${emailController.text}, ${phoneController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Teléfono'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(labelText: 'Confirmar Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
