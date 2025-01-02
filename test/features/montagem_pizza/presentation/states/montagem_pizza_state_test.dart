import 'package:easyfood_app/features/montagem_pizza/domain/entities/ingrediente_entity.dart';
import 'package:easyfood_app/features/montagem_pizza/domain/entities/pizza_tamanho_entity.dart';
import 'package:easyfood_app/features/montagem_pizza/domain/entities/sabor_pizza_entity.dart';
import 'package:easyfood_app/features/montagem_pizza/domain/entities/tamanho_pizza_entity.dart';
import 'package:easyfood_app/features/montagem_pizza/domain/repositories/i_adicional_pizza_tamanho_repository.dart';
import 'package:easyfood_app/features/montagem_pizza/domain/repositories/i_ingrediente_pizza_tamanho_repository.dart';
import 'package:easyfood_app/features/montagem_pizza/domain/repositories/i_pizza_tamanho_repository.dart';
import 'package:easyfood_app/features/montagem_pizza/domain/repositories/i_tamanho_pizza_repository.dart';
import 'package:easyfood_app/features/montagem_pizza/presentation/states/montagem_pizza_state.dart';
import 'package:easyfood_app/features/realizar_pedido/data/models/categoria_model_in.dart';
import 'package:easyfood_app/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

List<TamanhoPizzaEntity> tamanhos = [
  TamanhoPizzaEntity(
    codigo: 7,
    descricao: 'BROTO',
    sigla: 'B',
    ordem: 4,
    quantidadeSabores: 2,
  ),
  TamanhoPizzaEntity(
    codigo: 1,
    descricao: 'PEQUENA',
    sigla: 'PQ',
    ordem: 5,
    quantidadeSabores: 2,
  ),
  TamanhoPizzaEntity(
    codigo: 2,
    descricao: 'MEDIA',
    sigla: 'MD',
    ordem: 6,
    quantidadeSabores: 2,
  ),
  TamanhoPizzaEntity(
    codigo: 3,
    descricao: 'GRANDE',
    sigla: 'GD',
    ordem: 7,
    quantidadeSabores: 2,
  ),
  TamanhoPizzaEntity(
    codigo: 9,
    descricao: 'FAMILIA',
    sigla: 'F',
    ordem: 8,
    quantidadeSabores: 2,
  ),
];

final CategoriaModelIn categoriaPizza = CategoriaModelIn(
  codigo: 9,
  nome: 'PIZZAS',
  descricao: '',
  tipo: TipoCategoriaModel.PIZZA,
  visivelAppCliente: true,
  visivelAppGarcom: true,
  dispSegunda: true,
  dispTerca: true,
  dispQuarta: true,
  dispQuinta: true,
  dispSexta: true,
  dispSabado: true,
  dispDomingo: true,
  horaInicioSeg: 14400000,
  horaFinalSeg: 100740000,
  horaInicioTer: 14400000,
  horaFinalTer: 100740000,
  horaInicioQua: 14400000,
  horaFinalQua: 100740000,
  horaInicioQui: 14400000,
  horaFinalQui: 100740000,
  horaInicioSex: 14400000,
  horaFinalSex: 100740000,
  horaInicioSab: 14400000,
  horaFinalSab: 100740000,
  horaInicioDom: 14400000,
  horaFinalDom: 100740000,
);

List<PizzaTamanhoEntity> pizzasBroto = [
  PizzaTamanhoEntity(
    pizza: SaborPizzaEntity(codigo: 1, nome: 'Calabresa', nomePda: 'Calabresa', descricao: ''),
    descricao: 'Calabresa',
    tamanho: tamanhos.where((t) => t.codigo == 7).single,
    preco: 20.0,
    precoPromocao: 0.0,
    promocao: false,
    imprimir: true,
  ),
  PizzaTamanhoEntity(
    pizza: SaborPizzaEntity(codigo: 2, nome: 'Frango com Catupiry', nomePda: 'Frango com Catupiry', descricao: ''),
    descricao: 'Frango com Catupiry',
    tamanho: tamanhos.where((t) => t.codigo == 7).single,
    preco: 20.0,
    precoPromocao: 0.0,
    promocao: false,
    imprimir: true,
  ),
];

List<PizzaTamanhoEntity> pizzasPequenas = [
  PizzaTamanhoEntity(
    pizza: SaborPizzaEntity(codigo: 1, nome: 'Calabresa', nomePda: 'Calabresa', descricao: ''),
    descricao: 'Calabresa',
    tamanho: tamanhos.where((t) => t.codigo == 1).single,
    preco: 20.0,
    precoPromocao: 0.0,
    promocao: false,
    imprimir: true,
  ),
  PizzaTamanhoEntity(
    pizza: SaborPizzaEntity(codigo: 2, nome: 'Frango com Catupiry', nomePda: 'Frango com Catupiry', descricao: ''),
    descricao: 'Frango com Catupiry',
    tamanho: tamanhos.where((t) => t.codigo == 1).single,
    preco: 20.0,
    precoPromocao: 0.0,
    promocao: false,
    imprimir: true,
  ),
];

List<PizzaTamanhoEntity> pizzasMedias = [
  PizzaTamanhoEntity(
    pizza: SaborPizzaEntity(codigo: 1, nome: 'Calabresa', nomePda: 'Calabresa', descricao: ''),
    descricao: 'Calabresa',
    tamanho: tamanhos.where((t) => t.codigo == 2).single,
    preco: 20.0,
    precoPromocao: 0.0,
    promocao: false,
    imprimir: true,
  ),
  PizzaTamanhoEntity(
    pizza: SaborPizzaEntity(codigo: 2, nome: 'Frango com Catupiry', nomePda: 'Frango com Catupiry', descricao: ''),
    descricao: 'Frango com Catupiry',
    tamanho: tamanhos.where((t) => t.codigo == 2).single,
    preco: 20.0,
    precoPromocao: 0.0,
    promocao: false,
    imprimir: true,
  ),
];

List<PizzaTamanhoEntity> pizzasGrandes = [
  PizzaTamanhoEntity(
    pizza: SaborPizzaEntity(codigo: 1, nome: 'Calabresa', nomePda: 'Calabresa', descricao: ''),
    descricao: 'Calabresa',
    tamanho: tamanhos.where((t) => t.codigo == 3).single,
    preco: 20.0,
    precoPromocao: 0.0,
    promocao: false,
    imprimir: true,
  ),
  PizzaTamanhoEntity(
    pizza: SaborPizzaEntity(codigo: 2, nome: 'Frango com Catupiry', nomePda: 'Frango com Catupiry', descricao: ''),
    descricao: 'Frango com Catupiry',
    tamanho: tamanhos.where((t) => t.codigo == 3).single,
    preco: 20.0,
    precoPromocao: 0.0,
    promocao: false,
    imprimir: true,
  ),
];

List<PizzaTamanhoEntity> pizzasFamilia = [
  PizzaTamanhoEntity(
    pizza: SaborPizzaEntity(codigo: 1, nome: 'Calabresa', nomePda: 'Calabresa', descricao: ''),
    descricao: 'Calabresa',
    tamanho: tamanhos.where((t) => t.codigo == 9).single,
    preco: 20.0,
    precoPromocao: 0.0,
    promocao: false,
    imprimir: true,
  ),
  PizzaTamanhoEntity(
    pizza: SaborPizzaEntity(codigo: 2, nome: 'Frango com Catupiry', nomePda: 'Frango com Catupiry', descricao: ''),
    descricao: 'Frango com Catupiry',
    tamanho: tamanhos.where((t) => t.codigo == 9).single,
    preco: 20.0,
    precoPromocao: 0.0,
    promocao: false,
    imprimir: true,
  ),
];

final ingredientes = [
  IngredienteEntity(codigo: 1, nome: 'Ingrediente 1', valor: 0),
  IngredienteEntity(codigo: 2, nome: 'Ingrediente 2', valor: 0),
  IngredienteEntity(codigo: 3, nome: 'Ingrediente 3', valor: 0),
];

final adicionais = [
  IngredienteEntity(codigo: 4, nome: 'Adicional 1', valor: 1),
  IngredienteEntity(codigo: 5, nome: 'Adicional 2', valor: 2),
  IngredienteEntity(codigo: 6, nome: 'Adicional 3', valor: 3),
];

class ITamanhoPizzaRepositoryMock extends Mock implements ITamanhoPizzaRepository {}

class IPizzaTamanhoRepositoryMock extends Mock implements IPizzaTamanhoRepository {}

class IIngredientePizzaTamanhoRepositoryMock extends Mock implements IIngredientePizzaTamanhoRepository {}

class IAdicionalPizzaTamanhoRepositoryMock extends Mock implements IAdicionalPizzaTamanhoRepository {}

void main() {
  setUpAll(() {
    GetIt.instance.registerSingleton<ITamanhoPizzaRepository>(ITamanhoPizzaRepositoryMock());
    GetIt.instance.registerSingleton<IPizzaTamanhoRepository>(IPizzaTamanhoRepositoryMock());
    GetIt.instance.registerSingleton<IIngredientePizzaTamanhoRepository>(IIngredientePizzaTamanhoRepositoryMock());
    GetIt.instance.registerSingleton<IAdicionalPizzaTamanhoRepository>(IAdicionalPizzaTamanhoRepositoryMock());
  });

  test('deve carregar os tamanhos no método init', () {
    final tamanhoRepository = getIt<ITamanhoPizzaRepository>();
    when(() => tamanhoRepository.findAll()).thenAnswer((_) async => tamanhos);
    final state = MontagemPizzaState(
      pizzaTamanhoRepository: getIt<IPizzaTamanhoRepository>(),
      tamanhoPizzaRepository: getIt<ITamanhoPizzaRepository>(),
    );

    expect(state.init(), completes);
  });

  test('deve iniciar com os sabores selecionados vazio', () async {
    final tamanhoRepository = getIt<ITamanhoPizzaRepository>();
    when(() => tamanhoRepository.findAll()).thenAnswer((_) async => tamanhos);
    final state = MontagemPizzaState(
      pizzaTamanhoRepository: getIt<IPizzaTamanhoRepository>(),
      tamanhoPizzaRepository: getIt<ITamanhoPizzaRepository>(),
    );

    await state.init();

    expect(state.saboresSelecionados, isEmpty);
  });

  test('deve carregar os sabores do tamanho selecionado', () async {
    final tamanhoRepository = getIt<ITamanhoPizzaRepository>();
    when(() => tamanhoRepository.findAll()).thenAnswer((_) async => tamanhos);
    final pizzaTamanhoRepository = getIt<IPizzaTamanhoRepository>();
    when(() => pizzaTamanhoRepository.findByTamanho(7)).thenAnswer((_) async => pizzasBroto);
    final state = MontagemPizzaState(
      pizzaTamanhoRepository: getIt<IPizzaTamanhoRepository>(),
      tamanhoPizzaRepository: getIt<ITamanhoPizzaRepository>(),
    );
    await state.init();

    await state.handleTamanhoSelect(state.tamanhos[0]);

    expect(state.sabores, isNotEmpty);
    expect(state.sabores.length, pizzasBroto.length);
    expect(state.sabores[0], pizzasBroto[0]);
  });

  test('deve incrementar em um a lista de sabores ao selecionar sabor', () async {
    final tamanhoRepository = getIt<ITamanhoPizzaRepository>();
    when(() => tamanhoRepository.findAll()).thenAnswer((_) async => tamanhos);
    final pizzaTamanhoRepository = getIt<IPizzaTamanhoRepository>();
    when(() => pizzaTamanhoRepository.findByTamanho(7)).thenAnswer((_) async => pizzasBroto);
    final state = MontagemPizzaState(
      pizzaTamanhoRepository: getIt<IPizzaTamanhoRepository>(),
      tamanhoPizzaRepository: getIt<ITamanhoPizzaRepository>(),
    );
    await state.init();
    await state.handleTamanhoSelect(state.tamanhos[0]);

    state.selectSabor(state.sabores[0]);

    expect(state.saboresSelecionados, isNotEmpty);
    expect(state.saboresSelecionados.length, 1);
    expect(state.saboresSelecionados[0], state.sabores[0]);
  });

  test('deve incrementar em um a lista de sabores ao selecionar sabor já selecionado', () async {
    // Arrange
    final tamanhoRepository = getIt<ITamanhoPizzaRepository>();
    when(() => tamanhoRepository.findAll()).thenAnswer((_) async => tamanhos);
    final pizzaTamanhoRepository = getIt<IPizzaTamanhoRepository>();
    when(() => pizzaTamanhoRepository.findByTamanho(7)).thenAnswer((_) async => pizzasBroto);
    final state = MontagemPizzaState(
      pizzaTamanhoRepository: getIt<IPizzaTamanhoRepository>(),
      tamanhoPizzaRepository: getIt<ITamanhoPizzaRepository>(),
    );
    await state.init();
    await state.handleTamanhoSelect(state.tamanhos[0]);

    // Act
    state.selectSabor(state.sabores[0]);
    state.selectSabor(state.sabores[0]);

    // Assert
    expect(state.saboresSelecionados, isNotEmpty);
  });

  test('não deve remover tamanho selecionar se tentar selecionar novamente o mesmo tamanho selecionado', () async {
    // Arrange
    final tamanhoRepository = getIt<ITamanhoPizzaRepository>();
    when(() => tamanhoRepository.findAll()).thenAnswer((_) async => tamanhos);
    final pizzaTamanhoRepository = getIt<IPizzaTamanhoRepository>();
    when(() => pizzaTamanhoRepository.findByTamanho(7)).thenAnswer((_) async => pizzasBroto);
    final state = MontagemPizzaState(
      pizzaTamanhoRepository: getIt<IPizzaTamanhoRepository>(),
      tamanhoPizzaRepository: getIt<ITamanhoPizzaRepository>(),
    );
    await state.init();

    // Act
    await state.handleTamanhoSelect(state.tamanhos[0]);
    await state.handleTamanhoSelect(state.tamanhos[0]);

    // Assert
    expect(state.tamanhoSelecionado, isNotNull);
  });

  test(
      'Ao adicionar um sabor, desmarcar ingredientes e remover o sabor, ao adicionar pela segunda vez deve ter todos os ingredientes selecionados',
      () async {
    //Arrange
    final tamanhoRepository = getIt<ITamanhoPizzaRepository>();
    when(() => tamanhoRepository.findAll()).thenAnswer((_) async => tamanhos);
    final pizzaTamanhoRepository = getIt<IPizzaTamanhoRepository>();
    when(() => pizzaTamanhoRepository.findByTamanho(7)).thenAnswer((_) async => pizzasBroto);
    final state = MontagemPizzaState(
      pizzaTamanhoRepository: getIt<IPizzaTamanhoRepository>(),
      tamanhoPizzaRepository: getIt<ITamanhoPizzaRepository>(),
    );
    final ingredienteRepository = getIt<IIngredientePizzaTamanhoRepository>();
    when(() => ingredienteRepository.getIngredientesPizzaTamanho(idPizza: 1, idTamanho: 7))
        .thenAnswer((_) async => ingredientes);

    await state.init();
    await state.handleTamanhoSelect(state.tamanhos[0]);
    state.selectSabor(state.sabores[0]);
    await state.carregarComplementos(state.sabores[0]);

    //Act
    state.saboresSelecionados[0].ingredientes[0].selecionado = false;
    state.unselectSabor(state.sabores[0]);
    state.selectSabor(state.sabores[0]);

    //Assert
    expect(state.sabores[0].ingredientes[0].selecionado, true);
  });

  test(
      'Ao adicionar um sabor, desmarcar adicionais e remover o sabor, ao adicionar pela segunda vez não deve ter adicionais selecionados',
      () async {
    //Arrange
    final tamanhoRepository = getIt<ITamanhoPizzaRepository>();
    when(() => tamanhoRepository.findAll()).thenAnswer((_) async => tamanhos);
    final pizzaTamanhoRepository = getIt<IPizzaTamanhoRepository>();
    when(() => pizzaTamanhoRepository.findByTamanho(7)).thenAnswer((_) async => pizzasBroto);
    final state = MontagemPizzaState(
      pizzaTamanhoRepository: getIt<IPizzaTamanhoRepository>(),
      tamanhoPizzaRepository: getIt<ITamanhoPizzaRepository>(),
    );
    final ingredienteRepository = getIt<IAdicionalPizzaTamanhoRepository>();
    when(() => ingredienteRepository.getAdicionaisPizzaTamanho(idPizza: 1, idTamanho: 7))
        .thenAnswer((_) async => adicionais);

    await state.init();
    await state.handleTamanhoSelect(state.tamanhos[0]);
    state.selectSabor(state.sabores[0]);
    await state.carregarComplementos(state.sabores[0]);

    //Act
    state.saboresSelecionados[0].adicionais[0].selecionado = true;
    state.unselectSabor(state.sabores[0]);
    state.selectSabor(state.sabores[0]);

    //Assert
    expect(state.sabores[0].adicionais[0].selecionado, false);
  });
}
