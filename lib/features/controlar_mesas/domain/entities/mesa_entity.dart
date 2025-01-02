import 'package:easyfood_app/features/controlar_mesas/domain/entities/status_mesa.dart';

class MesaEntity {
  int codigo;
  String? cliente;
  String? observacao;
  StatusMesa status;
  bool bloqueada;

  MesaEntity({
    required this.codigo,
    this.cliente,
    this.observacao,
    required this.status,
    this.bloqueada = false,
  });
}
