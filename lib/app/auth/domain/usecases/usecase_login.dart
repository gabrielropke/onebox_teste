import 'package:dartz/dartz.dart';
import 'package:onebox_teste/app/auth/domain/entities/user_login.dart';
import 'package:onebox_teste/app/auth/domain/errors/errors.dart';
import 'package:onebox_teste/app/auth/domain/repositories/auth_repository.dart';

abstract class IUsecaseLogin {
  Future<Either<AuthException, UserLogin>> call(CredencialParams params);
}

class UsecaseLogin implements IUsecaseLogin{

  final AuthRepository repository;

  UsecaseLogin({required this.repository});

  @override
  Future<Either<AuthException, UserLogin>> call(CredencialParams params) async {
    if (params.email.isEmpty){
      return left(AuthException(message: 'Verifique seu e-mail e tente novamente'));
    }

    if (params.password.isEmpty) {
      return left(AuthException(message: 'Verifique seu e-mail e tente novamente'));
    }

    return await repository.login(params);
  }
}

class CredencialParams {
  final String email;
  final String password;

  CredencialParams({required this.email, required this.password});
}