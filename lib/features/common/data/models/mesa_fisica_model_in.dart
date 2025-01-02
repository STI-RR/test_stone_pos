import 'package:easyfood_app/features/common/domain/entities/mesa_fisica_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mesa_fisica_model_in.g.dart';

@JsonSerializable()
class MesaFisicaModelIn {
  final int codigo;
  final String descricao;

  MesaFisicaModelIn({
    required this.codigo,
    required this.descricao,
  });

  factory MesaFisicaModelIn.fromJson(Map<String, dynamic> json) => _$MesaFisicaModelInFromJson(json);

  Map<String, dynamic> toJson() => _$MesaFisicaModelInToJson(this);

  MesaFisicaEntity toEntity() => MesaFisicaEntity(
        id: codigo,
        descricao: descricao,
      );
}
