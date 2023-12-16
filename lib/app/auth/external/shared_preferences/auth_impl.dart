import 'package:onebox_teste/app/auth/domain/entities/user_login.dart';
import 'package:onebox_teste/app/auth/domain/usecases/usecase_login.dart';
import 'package:onebox_teste/app/auth/infra/datasources/auth_datasource.dart';

class auth_impl implements AuthDataSource {
  @override
  Future<UserLogin> login(CredencialParams params) async {
    return UserLogin(name: 'Gabriel', email: 'onebox@gmail.com');
  }
}
 