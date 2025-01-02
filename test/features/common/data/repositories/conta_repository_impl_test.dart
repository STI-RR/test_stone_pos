import 'package:easyfood_app/core/exception/datasource_exception.dart';
import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/features/common/data/datasources/conta_datasource.dart';
import 'package:easyfood_app/features/common/data/repositories/conta_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockContaDataSource extends Mock implements ContaDataSource {}

void main() {
  test('deve lançar RepositoryException quando retorno da api for FORBIDDEN', () async {
    //Arrange
    final mockDataSource = MockContaDataSource();
    when(() => mockDataSource.fecharConta(any())).thenThrow(DataSourceException('403 Forbidden'));
    final repository = ContaRepositoryImpl(mockDataSource);

    //Act
    final call = repository.fecharConta;

    //Assert
    expect(() => call(1, funcionarioId: 1, quantidadePessoas: 1), throwsA(isA<RepositoryException>()));
  });

  test('deve lançar RepositoryException quando retorno for CONFLICT', () async {
    //Arrange
    final mockDataSource = MockContaDataSource();
    when(() => mockDataSource.fecharConta(any())).thenThrow(DataSourceException('409 Conflict'));
    final repository = ContaRepositoryImpl(mockDataSource);

    //Act
    final call = repository.fecharConta;

    //Assert
    expect(() => call(1, funcionarioId: 1, quantidadePessoas: 1), throwsA(isA<RepositoryException>()));
  });

  test('deve lançar RepositoryException quando retorno for BAD_REQUEST', () async {
    //Arrange
    final mockDataSource = MockContaDataSource();
    when(() => mockDataSource.fecharConta(any())).thenThrow(DataSourceException('400 Bad Request'));
    final repository = ContaRepositoryImpl(mockDataSource);

    //Act
    final call = repository.fecharConta;

    //Assert
    expect(() => call(1, funcionarioId: 1, quantidadePessoas: 1), throwsA(isA<RepositoryException>()));
  });

  test('deve lançar RepositoryException quando retorno for INTERNAL_SERVER_ERROR', () async {
    //Arrange
    final mockDataSource = MockContaDataSource();
    when(() => mockDataSource.fecharConta(any())).thenThrow(DataSourceException('500 Internal Server Error'));
    final repository = ContaRepositoryImpl(mockDataSource);

    //Act
    final call = repository.fecharConta;

    //Assert
    expect(() => call(1, funcionarioId: 1, quantidadePessoas: 1), throwsA(isA<RepositoryException>()));
  });
}
