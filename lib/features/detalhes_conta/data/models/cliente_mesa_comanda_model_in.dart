import 'package:json_annotation/json_annotation.dart';

part 'cliente_mesa_comanda_model_in.g.dart';

@JsonSerializable()
class ClienteMesaComandaModelIn {
  final int codigo;
  final String nome;
  final String celular;
  final String? cpf;
  final String? rg;
  final bool? socio;
  final bool? inadimplente;

  ClienteMesaComandaModelIn({
    required this.codigo,
    required this.nome,
    required this.celular,
    this.cpf,
    this.rg,
    this.socio,
    this.inadimplente,
  });

  factory ClienteMesaComandaModelIn.fromJson(Map<String, dynamic> json) => _$ClienteMesaComandaModelInFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteMesaComandaModelInToJson(this);
}
