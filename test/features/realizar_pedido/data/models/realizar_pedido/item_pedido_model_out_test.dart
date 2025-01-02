import 'dart:math';

import 'package:easyfood_app/features/realizar_pedido/data/models/realizar_pedido/item_pedido_model_out.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/entities/item_cardapio_entity.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/entities/tabela_de_preco_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ItemCardapioEntity itemCardapioProduto;

  setUp(() {
    const precoPadrao = 1.0;

    final tabelaDePrecos = TabelaDePrecoEntity(
      precoSegunda: precoPadrao,
      precoTerca: precoPadrao,
      precoQuarta: precoPadrao,
      precoQuinta: precoPadrao,
      precoSexta: precoPadrao,
      precoSabado: precoPadrao,
      precoDomingo: precoPadrao,
      valorPromocao: precoPadrao,
      horaInicialSegunda: 14400000,
      horaFinalSegunda: 100740000,
      horaInicialDomingo: 14400000,
      horaFinalDomingo: 100740000,
      horaInicialTerca: 14400000,
      horaFinalTerca: 100740000,
      horaInicialQuarta: 14400000,
      horaFinalQuarta: 100740000,
      horaInicialQuinta: 14400000,
      horaFinalQuinta: 100740000,
      horaInicialSexta: 14400000,
      horaFinalSexta: 100740000,
      horaInicialSabado: 14400000,
      horaFinalSabado: 100740000,
    );
    itemCardapioProduto = ItemCardapioProdutoEntity(
      codigo: 1,
      nome: 'nome',
      nomePda: 'nome',
      opcionais: [],
      tabelaDePrecos: tabelaDePrecos,
    );
  });

  test('Deve levar a quantidade do item ao model', () async {
    //Arrange
    final quantidade = Random().nextInt(10) + 1;
    itemCardapioProduto.quantidade = quantidade;

    //Act
    final model = ItemPedidoModelOut.fromItemPedido(itemCardapioProduto);

    //Assert
    expect(model.quantidade, quantidade);
  });
}
