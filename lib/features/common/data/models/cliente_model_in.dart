import 'package:easyfood_app/features/common/domain/entities/cliente_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cliente_model_in.g.dart';

@JsonSerializable()
class ClienteModelIn {
  int codigo;
  String nome;
  String? celular;
  String? cpf;
  String? rg;
  bool? socio;
  bool? inadimplente;

  ClienteModelIn({
    required this.codigo,
    required this.nome,
    this.celular,
    this.cpf,
    this.rg,
    this.socio,
    this.inadimplente,
  });

  factory ClienteModelIn.fromJson(Map<String, dynamic> json) => _$ClienteModelInFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteModelInToJson(this);

  ClienteEntity toEntity() => ClienteEntity(
        codigo: codigo,
        nome: nome,
        telefone: celular,
        cpf: cpf,
        inadimplente: inadimplente ?? false,
      );
}
