import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:onebox_teste/app/app_module.dart';
import 'package:onebox_teste/app/auth/presenter/pages/home_screen.dart';
import 'package:onebox_teste/app/auth/presenter/pages/login_screen.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onebox',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Circular-std'
      ),
      routes: {
        '/login': (context) => login_screen(),
        '/home': (context) => const home_screen()
      },
      initialRoute: '/home',
    );
  }
}
