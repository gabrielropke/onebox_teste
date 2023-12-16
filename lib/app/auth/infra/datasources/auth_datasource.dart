import 'package:onebox_teste/app/auth/domain/entities/user_login.dart';
import 'package:onebox_teste/app/auth/domain/usecases/usecase_login.dart';

abstract class AuthDataSource {
  Future<UserLogin> login(CredencialParams params);
}
