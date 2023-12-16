import 'package:dartz/dartz.dart';
import 'package:onebox_teste/app/auth/domain/entities/user_login.dart';
import 'package:onebox_teste/app/auth/domain/errors/errors.dart';
import 'package:onebox_teste/app/auth/domain/repositories/auth_repository.dart';
import 'package:onebox_teste/app/auth/domain/usecases/usecase_login.dart';
import 'package:onebox_teste/app/auth/infra/datasources/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Either<AuthException, UserLogin>> login(
      CredencialParams params) async {
    try {
      final user = await datasource.login(params);
      return Right(user);
    } on AuthException catch (e) {
      return Left(e);
    } on Exception {
      return Left(AuthException(message: 'Excpetion error'));
    }
  }
}
