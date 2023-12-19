import 'package:flutter_modular/flutter_modular.dart';
import 'package:onebox_teste/app/presenter/pages/home_screen.dart';
import 'package:onebox_teste/app/presenter/pages/login_screen.dart';

class AppModule extends Module {
  @override

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (context, args) => const login_screen()),
    ChildRoute('/home', child: (context, args) => const home_screen()),
  ];
}
