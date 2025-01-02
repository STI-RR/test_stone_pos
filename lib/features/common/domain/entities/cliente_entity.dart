import 'package:easyfood_app/features/common/domain/entities/endereco_entity.dart';

class ClienteEntity {
  int? codigo;
  String? nome;
  String? telefone;
  String? cpf;
  bool inadimplente;
  List<EnderecoEntity>? enderecos;

  ClienteEntity({
    this.codigo,
    this.nome,
    this.telefone,
    this.cpf,
    this.enderecos,
    this.inadimplente = false,
  });

  ClienteEntity copyWith({
    int? codigo,
    String? nome,
    String? telefone,
    String? cpf,
    List<EnderecoEntity>? enderecos,
    bool? inadimplente,
  }) {
    return ClienteEntity(
      codigo: codigo ?? this.codigo,
      nome: nome ?? this.nome,
      telefone: telefone ?? this.telefone,
      cpf: cpf ?? this.cpf,
      enderecos: enderecos ?? this.enderecos,
      inadimplente: inadimplente ?? this.inadimplente,
    );
  }
}
