import 'package:easyfood_app/features/common/data/models/bairro_model_in.dart';
import 'package:json_annotation/json_annotation.dart';

part 'endereco_entrega_model_in.g.dart';

@JsonSerializable()
class EnderecoEntregaModelIn {
  EnderecoEntregaModelIn({
    required this.codigo,
    required this.numero,
    required this.descricaoBairro,
    required this.complemento,
    required this.rua,
    required this.valorEntrega,
    required this.bairro,
  });

  int codigo;
  String numero;
  String descricaoBairro;
  String complemento;
  String rua;
  double valorEntrega;
  BairroModelIn bairro;

  factory EnderecoEntregaModelIn.fromJson(Map<String, dynamic> json) => _$EnderecoEntregaModelInFromJson(json);

  Map<String, dynamic> toJson() => _$EnderecoEntregaModelInToJson(this);
}
