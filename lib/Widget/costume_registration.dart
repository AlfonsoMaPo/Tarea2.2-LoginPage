import 'package:flutter/material.dart';

class CustomRegistration extends StatefulWidget {
  const CustomRegistration({
    super.key,
    required this.controller,
    required this.title,
    required this.ocupalengthmax,
    this.length,
    required this.icon,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController controller;
  final String title;
  final TextInputType keyboardType;
  final bool ocupalengthmax;
  final int? length;
  final Icon icon;

  @override
  State<CustomRegistration> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomRegistration> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.keyboardType == TextInputType.visiblePassword ? _obscureText : false,
      style: TextStyle(color: Colors.purple),
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
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      maxLength: widget.ocupalengthmax ? widget.length : null,
    );
  }
}
