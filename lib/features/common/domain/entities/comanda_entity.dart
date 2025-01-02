import 'package:easyfood_app/features/common/domain/entities/status_comanda.dart';

class ComandaEntity {
  int codigo;
  String? cliente;
  String? observacao;
  StatusComanda status;
  bool bloqueada;

  ComandaEntity({
    required this.codigo,
    this.cliente,
    this.observacao,
    required this.status,
    this.bloqueada = false,
  });
}
