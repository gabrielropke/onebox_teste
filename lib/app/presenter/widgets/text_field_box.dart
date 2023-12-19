import 'package:flutter/material.dart';

class text_field_box extends StatelessWidget {
  const text_field_box(
      {super.key, required this.controller, required this.sendText});

  final TextEditingController controller;
  final Function sendText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      style: const TextStyle(
        fontFamily: 'Calibri',
        color: Colors.black,
        fontSize: 17,
      ),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          color: const Color.fromARGB(255, 46, 43, 43),
          onPressed: () {
            sendText();
          },
          icon: SizedBox(
            width: 80,
            child: Image.asset('assets/images/icon_send.png'),
          ),
        ),
        filled: true,
        fillColor: const Color(0xFFF0F0F0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white)),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
        hintText: 'Preencha com informações',
        hintStyle: const TextStyle(
            color: Color(0xFFB5B5B5), fontWeight: FontWeight.w500),
      ),
    );
  }
}
