import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onebox_teste/app/auth/domain/entities/user_login.dart';
import 'package:onebox_teste/app/auth/domain/errors/errors.dart';
import 'package:onebox_teste/app/auth/domain/repositories/auth_repository.dart';
import 'package:onebox_teste/app/auth/domain/usecases/usecase_login.dart';

class AuthRepositoryTeste implements AuthRepository {
  @override
  Future<Either<AuthException, UserLogin>> login(
      CredencialParams params) async {
    if (params.password == 'errado') {
      return Left(AuthException(message: 'Erro na senha'));
    }

    return Right(UserLogin(name: 'Gabriel', email: params.email));
  }
}

void main() {
  final repository = AuthRepositoryTeste();
  final usecase = UsecaseLogin(repository: repository);
  testWidgets('Processo de login', (tester) async {
    final result = await usecase(
        CredencialParams(email: 'onebox@mail.com', password: '123'));

    expect(result.isRight(), true);
    expect(
        result.getOrElse(() => UserLogin(name: '', email: '')).name, 'Gabriel');
  });

  test('E-mail inválido', () async {
    final result =
        await usecase(CredencialParams(email: '', password: 'teste'));

    expect(result.isLeft(), true);
  });

  test('Senha inválida', () async {
    final result =
        await usecase(CredencialParams(email: 'onebox@mail.com', password: ''));

    expect(result.isLeft(), true);
  });
}
