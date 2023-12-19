import 'package:flutter/material.dart';

class text_field_login extends StatelessWidget {
  const text_field_login(
      {super.key,
      required this.controller,
      this.prefixIcon,
      this.suffixIcon,
      required this.obscureText,
      required this.keyboardType,
      required this.hintText,
      required this.titulo});

  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String hintText;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
              color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 3),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: const Color.fromARGB(255, 243, 243, 243),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.white)),
            contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color.fromARGB(255, 189, 185, 185),
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
