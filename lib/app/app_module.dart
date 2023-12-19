import 'package:flutter_modular/flutter_modular.dart';
import 'package:onebox_teste/app/auth/external/shared_preferences/auth_impl.dart';
import 'package:onebox_teste/app/auth/infra/datasources/auth_datasource.dart';
import 'package:onebox_teste/app/auth/presenter/pages/login_screen.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AuthDataSource>((i) => auth_impl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (context, args) => login_screen()),
  ];
}
