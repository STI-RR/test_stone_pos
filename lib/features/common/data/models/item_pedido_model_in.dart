import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_pedido_model_in.g.dart';

@JsonSerializable()
class ItemPedidoModelIn {
  String status;
  int codigo;
  int quantidade;
  double? peso;
  String descricao;
  String observacao;
  String promocao;
  double precoVenda;
  String? nomeFuncionario;
  int dataHoraPedido;
  String imprimir;
  double precoUnitario;
  int codConta;
  int? codMesa;
  int? codCartao;
  bool cobrarServico;
  bool imprimirFichaPos;

  ItemPedidoModelIn({
    required this.status,
    required this.codigo,
    required this.quantidade,
    required this.descricao,
    required this.observacao,
    required this.promocao,
    required this.precoVenda,
    this.nomeFuncionario,
    required this.dataHoraPedido,
    required this.imprimir,
    required this.precoUnitario,
    required this.codConta,
    this.codMesa,
    this.codCartao,
    required this.cobrarServico,
    required this.imprimirFichaPos,
  });

  factory ItemPedidoModelIn.fromJson(Map<String, dynamic> json) => _$ItemPedidoModelInFromJson(json);

  Map<String, dynamic> toJson() => _$ItemPedidoModelInToJson(this);

  ItemPedidoEntity toEntity() => ItemPedidoEntity(
        codigo: codigo,
        descricao: descricao,
        observacao: observacao,
        preco: precoVenda,
        quantidade: quantidade,
        peso: peso,
        funcionarioLancamento: nomeFuncionario ?? '',
        dataHoraLancamento: DateTime.fromMillisecondsSinceEpoch(dataHoraPedido),
        imprimirFichaPos: imprimirFichaPos,
      );
}
