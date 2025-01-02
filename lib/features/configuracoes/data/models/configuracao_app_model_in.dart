import 'package:json_annotation/json_annotation.dart';

part 'configuracao_app_model_in.g.dart';

@JsonSerializable()
class ConfiguracaoAppModelIn {
  bool padraoMesa;
  bool padraoCartao;
  bool padraoPraViagem;
  bool padraoDelivery;
  bool obsMesaFisicaPedido;
  bool obsMesaFisicaPedidoMesa;
  bool obsMesaFisicaPedidoCartao;
  bool obsMesaFisicaPedidoFicha;
  bool obsMesaFisicaConta;
  bool obsMesaFisicaContaMesa;
  bool obsMesaFisicaContaCartao;
  bool mostrarAbaDePizza;
  bool mostrarAbaDeCombo;
  String statusMesaFisica;
  bool escolhaCategoriaImpressao;

  ConfiguracaoAppModelIn({
    required this.padraoMesa,
    required this.padraoCartao,
    required this.padraoPraViagem,
    required this.padraoDelivery,
    required this.obsMesaFisicaPedido,
    required this.obsMesaFisicaPedidoMesa,
    required this.obsMesaFisicaPedidoCartao,
    required this.obsMesaFisicaPedidoFicha,
    required this.obsMesaFisicaConta,
    required this.obsMesaFisicaContaMesa,
    required this.obsMesaFisicaContaCartao,
    required this.mostrarAbaDePizza,
    required this.mostrarAbaDeCombo,
    required this.statusMesaFisica,
    required this.escolhaCategoriaImpressao,
  }) : assert(statusMesaFisica == 'ATIVADA' || statusMesaFisica == 'DESATIVADA');

  factory ConfiguracaoAppModelIn.fromJson(Map<String, dynamic> json) => _$ConfiguracaoAppModelInFromJson(json);

  Map<String, dynamic> toJson() => _$ConfiguracaoAppModelInToJson(this);
}
