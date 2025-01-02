import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/login/domain/entities/permissoes_entity.dart';
import 'package:easyfood_app/features/login/domain/entities/usuario_entity.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/entities/item_cardapio_entity.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/entities/pedido_entity.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/entities/tabela_de_preco_entity.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/repositories/i_pedido_repository.dart';
import 'package:easyfood_app/features/realizar_pedido/presentation/pages/pedido_controller.dart';
import 'package:easyfood_app/features/realizar_pedido/presentation/states/pedido_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIPedidoRepository extends Mock implements IPedidoRepository {}

void main() {
  late PedidoState state;
  late IPedidoRepository repository;
  late ItemCardapioProdutoEntity itemCardapio;
  final UsuarioEntity usuarioEntity = UsuarioEntity(
    codigoUsuario: 1,
    codigoFuncionario: 1,
    codigoAcesso: 1,
    nomeFuncionario: 'Funcionário',
    permissoes: PermissoesEntity(
      cancelarItens: '1',
      juntarContas: '1',
      pagarPOSContaEmDinheiro: '1',
      trocarContas: '1',
      visualizarConta: '1',
      chamados: '1',
      pedido: '1',
      revisarSolicitacaoDeConta: '1',
      fecharConta: '1',
      trocarItens: '1',
      pedidosPendentes: '1',
      pagarPOSContaEmDinheiroSemConfirmarSenha: '1',
    ),
  );

  setUp(() {
    state = PedidoState();
    repository = MockIPedidoRepository();
    itemCardapio = ItemCardapioProdutoEntity(
      codigo: 1,
      nome: 'Produto',
      nomePda: 'Produto',
      opcionais: [],
      tabelaDePrecos: TabelaDePrecoEntity(
        precoSegunda: 10,
        precoTerca: 10,
        precoQuarta: 10,
        precoQuinta: 10,
        precoSexta: 10,
        precoSabado: 10,
        precoDomingo: 10,
        valorPromocao: 10,
        horaInicialSegunda: 0,
        horaFinalSegunda: 0,
        horaInicialDomingo: 0,
        horaFinalDomingo: 0,
        horaInicialTerca: 0,
        horaFinalTerca: 0,
        horaInicialQuarta: 0,
        horaFinalQuarta: 0,
        horaInicialQuinta: 0,
        horaFinalQuinta: 0,
        horaInicialSexta: 0,
        horaFinalSexta: 0,
        horaInicialSabado: 0,
        horaFinalSabado: 0,
      ),
    );
    registerFallbackValue(PedidoEntity(funcionario: usuarioEntity.codigoAcesso, tokenUUID: 'abc123'));
  });

  test(
      'Ao iniciar um pedido com uma conta pra viagem, deve poder finalizar um pedido sem informar novamente o tipo da conta',
      () async {
    //Arrange
    final conta = ContaPraViagemEntity(
      codigo: 1,
      dataHoraAbertura: DateTime.now(),
      itensPedido: [],
      nomeClientePraViagem: 'Cliente pra viagem',
      subTotal: 0,
    );
    final controller = PedidoController(state, repository);
    when(() => repository.create(any())).thenAnswer((_) async => PedidoEntity(funcionario: 1, tokenUUID: 'abc123'));

    //Act
    state.init(usuarioEntity, conta: conta);
    state.add(itemCardapio);
    final future = controller.finalizarPedido(state.pedido!);

    //Assert
    expect(state.tipo, TipoPedido.viagem);
    expect(future, completes);
  });

  test('Ao iniciar um pedido com uma conta pra viagem, deve mandar ao repositório um pedido com o mesmo id da conta',
      () async {
    //Arrange
    final conta = ContaPraViagemEntity(
      codigo: 1,
      dataHoraAbertura: DateTime.now(),
      itensPedido: [],
      nomeClientePraViagem: 'Cliente pra viagem',
      subTotal: 0,
    );

    //Act
    state.init(usuarioEntity, conta: conta);

    //Assert
    expect(state.pedido!.conta, conta.codigo);
  });
}
