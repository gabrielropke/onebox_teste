import 'package:dartz/dartz.dart';
import 'package:onebox_teste/app/auth/domain/entities/user_login.dart';
import 'package:onebox_teste/app/auth/domain/errors/errors.dart';
import 'package:onebox_teste/app/auth/domain/usecases/usecase_login.dart';

abstract class AuthRepository {

  Future<Either<AuthException, UserLogin>> login(CredencialParams params);

}