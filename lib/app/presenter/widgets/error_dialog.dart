import 'package:flutter/material.dart';

class errorDialog {
  static void show(BuildContext context, String message, ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          content: FractionallySizedBox(
            heightFactor: 0.31,
            child: Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.2,
                  child: Image.asset('assets/images/icon_info.png', color: const Color(0xFFF28E1C),),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Oops...',
                  style: TextStyle(
                    fontFamily: 'Calibri',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  message,
                  style: const TextStyle(
                    fontFamily: 'calibri',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ), textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 90,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF27292D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Center(
                          child:
                              Text('Voltar', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
