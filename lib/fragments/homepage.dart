import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
      child:  Padding(padding: EdgeInsets.all(16),
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/OIP.aqj4oODFx1Ns0SUhcAFJhQHaFy?rs=1&pid=ImgDetMain',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '¡Hola,te extrañamos!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const  SizedBox(height: 10),
              Text(
                'Correo: $email',
                style:const TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                },
                icon: const Icon(Icons.arrow_forward), 
                label: const Text('Siguiente',style: TextStyle(fontSize: 16),), 
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
                  backgroundColor: Colors.blueAccent,
                ),
              ),
            ],
            ),
    )
    ),
    );
  }
}
