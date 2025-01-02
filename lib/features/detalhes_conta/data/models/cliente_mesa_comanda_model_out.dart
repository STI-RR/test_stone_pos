import 'package:json_annotation/json_annotation.dart';

part 'cliente_mesa_comanda_model_out.g.dart';

@JsonSerializable()
class ClienteMesaComandaModelOut {
  final String nome;
  final String telefone;
  final int? mesa;
  final int? cartao;

  ClienteMesaComandaModelOut({
    required this.nome,
    required this.telefone,
    this.mesa,
    this.cartao,
  });

  factory ClienteMesaComandaModelOut.fromJson(Map<String, dynamic> json) => _$ClienteMesaComandaModelOutFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteMesaComandaModelOutToJson(this);
}
