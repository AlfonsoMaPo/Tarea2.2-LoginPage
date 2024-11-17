import 'package:flutter/material.dart';
import 'package:myapp/Widget/costume_input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _login() {
    if (emailController.text == 'tu.correo@unah.edu.hn' &&
        passwordController.text == '12345678') {
      Navigator.pushReplacementNamed(context, '/home', arguments: emailController.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Credenciales incorrectas')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio de Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            const Text('Bienvenido de vuelta!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            const Text('Inicia sesión para poder seguir',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 30),
            CustomInput(
                title: 'Correo',
                emailController: emailController,
                ocupalengthmax: false,
                icon:const Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
            CustomInput(
                title: 'Contraseña',
                emailController: passwordController,
                keyboardType: TextInputType.visiblePassword,
                ocupalengthmax: false,
                icon:const Icon(Icons.lock)
                ),
            const Align(alignment: Alignment.centerRight,
            child:Text('Se me olvidó la contraseña')),

            const SizedBox(height: 50),

            SizedBox(height:40,width:double.infinity, 
            child:ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen.shade300
              ),
              child: const Text('Iniciar Sesión',style: TextStyle(fontSize: 18),)
              ),
            ), 
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('No tienes una cuenta?',
                style: TextStyle(fontSize: 15)),
              TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child:const Text('Registrarse',style: TextStyle(fontWeight:FontWeight.bold),)),
              ],
            ),
            
          ],
      ),
    ),
    );
  }
}
