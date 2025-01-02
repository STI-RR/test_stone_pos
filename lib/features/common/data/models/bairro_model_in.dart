import 'package:json_annotation/json_annotation.dart';

part 'bairro_model_in.g.dart';

@JsonSerializable()
class BairroModelIn {
  BairroModelIn({
    required this.codigo,
    required this.valorAdicional,
    required this.descricao,
  });

  int codigo;
  double valorAdicional;
  String descricao;

  factory BairroModelIn.fromJson(Map<String, dynamic> json) => _$BairroModelInFromJson(json);

  Map<String, dynamic> toJson() => _$BairroModelInToJson(this);
}
