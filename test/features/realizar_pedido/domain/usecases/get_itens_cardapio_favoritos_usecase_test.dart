import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/entities/item_cardapio_entity.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/entities/tabela_de_preco_entity.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/repositories/i_item_cardapio_repository.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/usecases/get_itens_cardapio_favoritos_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockItemCardapioRepository extends Mock implements IItemCardapioRepository {}

class MockTabelaDePreco extends Mock implements TabelaDePrecoEntity {}

void main() {
  late GetItensCardapioFavoritosUseCase useCase;
  late MockItemCardapioRepository mockItemCardapioRepository;
  late MockTabelaDePreco mockTabelaDePreco;

  setUp(() {
    mockItemCardapioRepository = MockItemCardapioRepository();
    useCase = GetItensCardapioFavoritosUseCase(mockItemCardapioRepository);
    mockTabelaDePreco = MockTabelaDePreco();
    when(() => mockTabelaDePreco.precoAtual).thenReturn(10.0);
  });

  test('should return list of ItemCardapioEntity', () async {
    // arrange
    when(() => mockItemCardapioRepository.getFavoritosFuncionario(any())).thenAnswer((_) async => []);
    when(() => mockItemCardapioRepository.getFavoritosGeral()).thenAnswer((_) async => []);

    // act
    final result = await useCase.call(GetItensCardapioFavoritosUseCaseParams(codigoFuncionario: 1));

    // assert
    expect(result.isSuccess, true);
    expect(result.isFailure, false);
    expect(result.asSuccess!.value, isA<List>());
  });

  test('should return failure', () async {
    // arrange
    when(() => mockItemCardapioRepository.getFavoritosFuncionario(any())).thenThrow(RepositoryException('mock error'));
    when(() => mockItemCardapioRepository.getFavoritosGeral()).thenThrow(RepositoryException('mock error'));

    // act
    final result = await useCase.call(GetItensCardapioFavoritosUseCaseParams(codigoFuncionario: 1));

    // assert
    expect(result.isSuccess, false);
    expect(result.isFailure, true);
    expect(result.asFailure!.message, 'mock error');
  });

  test('should not return duplicates ItemCardapioEntity', () async {
    //Arrange
    when(() => mockItemCardapioRepository.getFavoritosFuncionario(any())).thenAnswer((_) async => [
          ItemCardapioProdutoEntity(
              codigo: 1, nome: 'item 1', nomePda: 'item 1', opcionais: [], tabelaDePrecos: mockTabelaDePreco),
          ItemCardapioPratoEntity(
              codigo: 1,
              nome: 'prato 1',
              nomePda: 'prato 1',
              tabelaDePrecos: mockTabelaDePreco,
              ingredientes: [],
              opcionais: []),
          ItemCardapioPizzaEntity(nome: 'pizza 1', nomePda: 'pizza 1', valorUnitario: 10.0),
        ]);
    when(() => mockItemCardapioRepository.getFavoritosGeral()).thenAnswer((_) async => [
          ItemCardapioProdutoEntity(
              codigo: 1, nome: 'item 1', nomePda: 'item 1', opcionais: [], tabelaDePrecos: mockTabelaDePreco),
          ItemCardapioPratoEntity(
              codigo: 1,
              nome: 'prato 1',
              nomePda: 'prato 1',
              tabelaDePrecos: mockTabelaDePreco,
              ingredientes: [],
              opcionais: []),
          ItemCardapioPizzaEntity(nome: 'pizza 1', nomePda: 'pizza 1', valorUnitario: 10.0),
        ]);

    //Act
    final result = await useCase.call(GetItensCardapioFavoritosUseCaseParams(codigoFuncionario: 1));

    //Assert
    expect(result.isSuccess, true);
    expect(result.isFailure, false);
    expect(result.asSuccess!.value.length, 3);
  });
}
