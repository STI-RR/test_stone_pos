import 'package:easyfood_app/features/controlar_mesas/domain/entities/mesa_entity.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/status_mesa.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mesa_model_in.g.dart';

@JsonSerializable()
class MesaModelIn {
  int codigo;
  String descricao;
  bool? bloqueio;
  String? nomeCliente;
  String? celularCliente;
  String? observacao;
  String? initPointMercadoPagoPreferencia;
  String? situacao;
  String? statusPixCobranca;
  String? qrCodePixCobranca;
  bool? temReserva;
  dynamic reserva;

  MesaModelIn({
    this.bloqueio,
    required this.codigo,
    required this.descricao,
    this.initPointMercadoPagoPreferencia,
    required this.situacao,
    this.observacao,
    this.statusPixCobranca,
    this.qrCodePixCobranca,
    this.nomeCliente,
    this.celularCliente,
    this.temReserva,
    this.reserva,
  });

  factory MesaModelIn.fromJson(Map<String, dynamic> json) => _$MesaModelInFromJson(json);

  Map<String, dynamic> toJson() => _$MesaModelInToJson(this);

  MesaEntity toEntity() => MesaEntity(
        codigo: codigo,
        cliente: nomeCliente,
        observacao: observacao,
        status: situacao == 'LIVRE'
            ? StatusMesa.livre
            : situacao == 'OCUPADA'
                ? StatusMesa.ocupada
                : StatusMesa.fechamento,
        bloqueada: bloqueio ?? false,
      );
}
