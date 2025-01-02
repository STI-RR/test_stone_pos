import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';
import 'package:flutter/material.dart';

class DetalhesContaState extends ChangeNotifier {
  final ContaEntity conta;

  DetalhesContaState(this.conta);

  List<ItemPedidoEntity> get itens => conta.itensPedido;

  void refresh() async {
    conta.itensPedido = conta.itensPedido;
    notifyListeners();
  }
}
