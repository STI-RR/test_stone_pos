import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_ficha_impressao_entity.g.dart';

@JsonSerializable()
class ItemFichaImpressaoEntity {
  final int conta;
  final String descricao;
  final String observacao;
  final int index;
  final int ofIndex;
  final String funcionario;
  final double preco;
  bool selected = true;
  bool printed = false;

  ItemFichaImpressaoEntity({
    required this.conta,
    required this.descricao,
    required this.observacao,
    required this.index,
    required this.ofIndex,
    required this.funcionario,
    required this.preco,
  });

  factory ItemFichaImpressaoEntity.fromJson(Map<String, dynamic> json) => _$ItemFichaImpressaoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ItemFichaImpressaoEntityToJson(this);

  factory ItemFichaImpressaoEntity.fromItemPedido(int conta, ItemPedidoEntity itemPedido) {
    return ItemFichaImpressaoEntity(
      conta: conta,
      descricao: itemPedido.descricao,
      observacao: itemPedido.observacao,
      index: 0,
      ofIndex: 0,
      funcionario: '',
      preco: itemPedido.preco,
    );
  }
}
