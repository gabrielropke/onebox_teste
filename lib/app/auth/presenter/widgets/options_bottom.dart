import 'dart:io';

import 'package:flutter/material.dart';

class options_bottom extends StatelessWidget {
  const options_bottom({super.key, required this.clearCard});

  final Function clearCard;

  void viewOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
              20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            // ListTile(
            //   leading: IconButton(
            //       onPressed: () {},
            //       icon: const Icon(Icons.cleaning_services_outlined)),
            //   title: const Text(
            //     'Resetar Card',
            //     style: TextStyle(fontFamily: 'Calibri'),
            //   ),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              leading: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.exit_to_app)),
              title: const Text(
                'Retornar ao login',
                style: TextStyle(fontFamily: 'Calibri'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            if (Platform.isIOS)
              const SizedBox(
                width: double.infinity,
                height: 40,
              ),
            if (Platform.isAndroid)
              const SizedBox(
                width: double.infinity,
                height: 10,
              )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          viewOptions(context);
        },
        child: const Icon(Icons.more_horiz, color: Colors.black, size: 26));
  }
}
