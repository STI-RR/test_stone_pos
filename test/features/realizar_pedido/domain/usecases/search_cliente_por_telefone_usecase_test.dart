import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/features/common/domain/entities/cliente_entity.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/repositories/i_cliente_repository.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/usecases/search_cliente_por_telefone_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ClienteRepositoryMock extends Mock implements IClienteRepository {}

void main() {
  late IClienteRepository repository;
  late ClienteEntity cliente;

  setUp(() {
    repository = ClienteRepositoryMock();
    cliente = ClienteEntity();
  });

  test('Deve retornar um cliente se encontrar', () async {
    //Arrange
    when(() => repository.searchClientePorTelefone(any())).thenAnswer((_) async => cliente);
    final params = SearchClientePorTelefoneParams(telefone: '123456789');
    final usecase = SearchClientePorTelefoneUseCase(repository);

    //Act
    final result = await usecase(params);

    //Assert
    expect(result, isA<Success>());
  });

  test('Deve retornar null se não encontrar', () async {
    //Arrange
    when(() => repository.searchClientePorTelefone(any())).thenAnswer((_) async => null);
    final params = SearchClientePorTelefoneParams(telefone: '123456789');
    final usecase = SearchClientePorTelefoneUseCase(repository);

    //Act
    final result = await usecase(params);

    //Assert
    expect(result, isA<Success>());
    expect(result.asSuccess!.value, isNull);
  });

  test('Deve retornar failure se gerar exception no repository', () async {
    //Arrange
    when(() => repository.searchClientePorTelefone(any())).thenThrow(Exception());
    final params = SearchClientePorTelefoneParams(telefone: '123456789');
    final usecase = SearchClientePorTelefoneUseCase(repository);

    //Act
    final result = await usecase(params);

    //Assert
    expect(result, isA<Failure>());
  });
}
