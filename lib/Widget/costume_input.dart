import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
    super.key,
    required this.emailController,
    required this.title,
    required this.ocupalengthmax,
    this.length,
    required this.icon,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController emailController;
  final String title;
  final TextInputType keyboardType;
  final bool ocupalengthmax;
  final int? length;
  final Icon icon;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obscureText = false; 

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.emailController,
      keyboardType: widget.keyboardType,
      obscureText: widget.keyboardType == TextInputType.visiblePassword ? _obscureText : false, 
      style: const TextStyle(color: Colors.purple),
      decoration: InputDecoration(
        hintText: 'Ingrese su ${widget.title}',
        label: Text(widget.title),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        prefixIcon: widget.icon,
        suffixIcon: widget.keyboardType == TextInputType.visiblePassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {setState(() { _obscureText = !_obscureText; });},) : null, 
      ),
      maxLength: widget.ocupalengthmax ? widget.length : null,
    );
  }
}