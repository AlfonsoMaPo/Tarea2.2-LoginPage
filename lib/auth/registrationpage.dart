import 'package:flutter/material.dart';
import 'package:myapp/Widget/costume_registration.dart';

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

//no se puede usar snackbar aca XD
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
        padding:const EdgeInsets.all(22.0),
        child: Column(
          children: [
             const Text('Bienvenido a DandaDan',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
             const Text('Llena los siguientes campos para disfrutar de nuestos servicios',textAlign: TextAlign.center,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
            ),
            CustomRegistration(
              controller: nameController, 
              title: 'Nombre', 
              ocupalengthmax: true,
              length: 10, 
              icon:const Icon(Icons.person),
              
            ),
            CustomRegistration(
              controller: emailController, 
              title: 'Correo', 
              ocupalengthmax: false,
              icon:const Icon(Icons.email),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 21),

            CustomRegistration(
              controller: phoneController, 
              title: "Telefóno", 
              ocupalengthmax: true,
              length: 8,
              icon: const Icon(Icons.phone),
              keyboardType:TextInputType.phone
              ),

            CustomRegistration(
              controller: passwordController, 
              title: "Contraseña", 
              ocupalengthmax: false,
              icon: const Icon(Icons.lock),
              keyboardType:TextInputType.visiblePassword
              ),

            const SizedBox(height: 21),

             CustomRegistration(
              controller: confirmPasswordController, 
              title: "Confirmar contraseña", 
              ocupalengthmax: false,
              icon: const Icon(Icons.lock),
              keyboardType:TextInputType.visiblePassword
              ), 

            const SizedBox(height: 40),
            SizedBox(height:40,width:double.infinity, 
            child:ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen.shade400
              ),
              child: const Text('Registrarse',
              style: TextStyle(
                color: Colors.deepPurple,
               fontSize: 18),
               )
              ),
            ), 
          ],
        ),
      ),
    );
  }
}
