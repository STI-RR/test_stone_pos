import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/features/login/domain/entities/usuario_entity.dart';
import 'package:easyfood_app/features/login/domain/repositories/i_login_repository.dart';
import 'package:easyfood_app/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements ILoginRepository {}

class UsuarioEntityMock extends Mock implements UsuarioEntity {}

void main() {
  test('Não deve autenticar sem senha', () async {
    //Arrange
    final repository = LoginRepositoryMock();
    when(() => repository.login('')).thenThrow(RepositoryException('Senha não informada'));
    LoginParams loginParams = LoginParams('');

    //Act
    final result = await LoginUseCase(repository).call(loginParams);

    //Assert
    expect(result.isFailure, true);
  });

  test('Deve retornar resulte failure quando senha for errada', () async {
    //Arrange
    final repository = LoginRepositoryMock();
    when(() => repository.login('123456')).thenThrow(RepositoryException('Senha incorreta'));
    LoginParams loginParams = LoginParams('123456');

    //Act
    final result = await LoginUseCase(repository).call(loginParams);

    //Assert
    expect(result.isFailure, true);
  });

  test('Deve retornar resulte success quando senha for correta', () async {
    //Arrange
    final repository = LoginRepositoryMock();
    when(() => repository.login('123456')).thenAnswer((_) async => Future.value(UsuarioEntityMock()));
    LoginParams loginParams = LoginParams('123456');

    //Act
    final result = await LoginUseCase(repository).call(loginParams);

    //Assert
    expect(result.isSuccess, true);
  });
}
