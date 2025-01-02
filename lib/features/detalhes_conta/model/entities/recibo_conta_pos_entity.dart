import 'package:easyfood_app/features/detalhes_conta/model/entities/item_recibo_conta_pos_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recibo_conta_pos_entity.g.dart';

@JsonSerializable()
class ReciboContaPosEntity {
  ReciboContaPosEntity({
    required this.descricao,
    required this.codigo,
    required this.observacao,
    required this.subTotal,
    required this.tituloServico,
    required this.servico,
    required this.cobrarCouvert,
    required this.couvert,
    required this.quantidadeDePessoas,
    required this.total,
    required this.itens,
    required this.nomeEstabelecimento,
    required this.funcionario,
    this.qrCodePixImageBase64,
  });

  String descricao;
  int codigo;
  String observacao;
  double subTotal;
  String tituloServico;
  double servico;
  bool cobrarCouvert;
  double couvert;
  int quantidadeDePessoas;
  double total;
  List<ItemReciboContaPosEntity> itens;
  String nomeEstabelecimento;
  String funcionario;
  String? qrCodePixImageBase64;

  factory ReciboContaPosEntity.fromJson(Map<String, dynamic> json) => _$ReciboContaPosEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReciboContaPosEntityToJson(this);
}
