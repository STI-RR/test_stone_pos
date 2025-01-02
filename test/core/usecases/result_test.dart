import 'package:easyfood_app/core/usecases/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testes com construtor Result.success', () {
    test('Construtor factory de Result.success deve resultar em getter isSuccess = true', () async {
      //Arrange
      final result = Result.success('');

      //Act
      final isSuccess = result.isSuccess;

      //Assert
      expect(isSuccess, true);
    });
    test('Construtor factory de Result.success deve resultar objeto nao nulo em Result.asSuccess', () async {
      //Arrange
      final result = Result.success('');

      //Act
      final asSuccess = result.asSuccess;

      //Assert
      expect(asSuccess, isNotNull);
    });

    test('Construtor factory de Result.success deve resultar objeto nulo em Result.asFailure', () async {
      //Arrange
      final result = Result.success('');

      //Act
      final asSuccess = result.asFailure;

      //Assert
      expect(asSuccess, isNull);
    });
  });

  group('Testes com construtor Result.failure', () {
    test('Construtor factory de Result.failure deve resultar em getter isSuccess = false', () async {
      //Arrange
      final result = Result.failure('');

      //Act
      final isSuccess = result.isSuccess;

      //Assert
      expect(isSuccess, false);
    });
    test('Construtor factory de Result.failure deve resultar em objeto nao nulo em Result.asFailure', () async {
      //Arrange
      final result = Result.failure('');

      //Act
      final asFailure = result.asFailure;

      //Assert
      expect(asFailure, isNotNull);
    });

    test('Construtor factory de Result.failure deve resultar em objeto nulo em Result.asSuccess', () async {
      //Arrange
      final result = Result.failure('');

      //Act
      final asFailure = result.asSuccess;

      //Assert
      expect(asFailure, isNull);
    });
  });
}
