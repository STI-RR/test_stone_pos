import 'package:json_annotation/json_annotation.dart';

part 'cobranca_pix_model_in.g.dart';

@JsonSerializable()
class CobrancaPixModelIn {
  final String qrCode;
  final double valor;
  final int criacao;
  final int expiracaoEmSegundos;
  final bool ativa;
  final bool concluida;

  CobrancaPixModelIn({
    required this.qrCode,
    required this.valor,
    required this.criacao,
    required this.expiracaoEmSegundos,
    required this.ativa,
    required this.concluida,
  });

  factory CobrancaPixModelIn.fromJson(Map<String, dynamic> json) => _$CobrancaPixModelInFromJson(json);

  Map<String, dynamic> toJson() => _$CobrancaPixModelInToJson(this);
}
