import 'package:json_annotation/json_annotation.dart';

part 'categoria_impressao_model_in.g.dart';

@JsonSerializable()
class CategoriaImpressaoModelIn {
  int codigo;
  String descricao;

  CategoriaImpressaoModelIn({
    required this.codigo,
    required this.descricao,
  });

  factory CategoriaImpressaoModelIn.fromJson(Map<String, dynamic> json) => _$CategoriaImpressaoModelInFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriaImpressaoModelInToJson(this);
}
