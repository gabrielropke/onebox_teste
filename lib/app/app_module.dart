import 'package:flutter_modular/flutter_modular.dart';
import 'package:onebox_teste/app/auth/domain/repositories/auth_repository.dart';
import 'package:onebox_teste/app/auth/domain/usecases/usecase_login.dart';
import 'package:onebox_teste/app/auth/external/shared_preferences/auth_impl.dart';
import 'package:onebox_teste/app/auth/infra/datasources/auth_datasource.dart';
import 'package:onebox_teste/app/auth/infra/repositories/auth_repository_impl.dart';
import 'package:onebox_teste/app/auth/presenter/pages/login_screen.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => UsecaseLogin(repository: i())),
    Bind.lazySingleton<AuthRepository>(
        (i) => AuthRepositoryImpl(datasource: i())),
    Bind.lazySingleton<AuthDataSource>((i) => auth_impl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (context, args) => const login_screen()),
  ];
}
