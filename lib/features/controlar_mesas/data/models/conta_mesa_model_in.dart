import 'package:easyfood_app/features/common/data/models/cliente_model_in.dart';
import 'package:easyfood_app/features/common/domain/entities/cliente_entity.dart';
import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/common/domain/entities/pessoa_entity.dart';
import 'package:easyfood_app/features/controlar_mesas/data/models/mesa_model_in.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/mesa_entity.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/status_mesa.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conta_mesa_model_in.g.dart';

@JsonSerializable()
class ContaMesaModelIn {
  int codigo;
  int? senha;
  MesaModelIn mesa;
  int dataHoraInicio;
  ClienteModelIn? cliente;
  String? qrCodePix;
  String? qrCodePagamentoOnline;
  int? quantidadePessoas;
  bool cobrarCouvert;
  bool couvertFixo;
  double? valorCouvert;
  double? valorServico;
  double? valorItens;
  double? valorCreditos;
  String? nomeClientePraViagem;
  String? formaPagamento;
  double? valorAPagar;
  double? valorEntrega;
  double? adicional;
  String? nomeFuncionarioAbertura;
  bool? bloqueio;

  ContaMesaModelIn({
    required this.codigo,
    this.senha,
    required this.mesa,
    required this.dataHoraInicio,
    this.cliente,
    this.qrCodePix,
    this.qrCodePagamentoOnline,
    this.quantidadePessoas,
    required this.cobrarCouvert,
    required this.couvertFixo,
    this.valorCouvert,
    this.valorServico,
    this.valorItens,
    this.valorCreditos,
    this.nomeClientePraViagem,
    this.formaPagamento,
    this.valorAPagar,
    this.valorEntrega,
    this.adicional,
    this.nomeFuncionarioAbertura,
    this.bloqueio,
  });

  factory ContaMesaModelIn.fromJson(Map<String, dynamic> json) => _$ContaMesaModelInFromJson(json);

  Map<String, dynamic> toJson() => _$ContaMesaModelInToJson(this);

  ContaMesaEntity toEntity() => ContaMesaEntity(
        codigo: codigo,
        senha: senha.toString(),
        dataHoraAbertura: DateTime.fromMillisecondsSinceEpoch(dataHoraInicio),
        dataHoraPagamento: null,
        itensPedido: [],
        mesa: MesaEntity(
          codigo: mesa.codigo,
          cliente: mesa.nomeCliente,
          status: mesa.situacao == 'LIVRE'
              ? StatusMesa.livre
              : mesa.situacao == 'OCUPADA'
                  ? StatusMesa.ocupada
                  : StatusMesa.fechamento,
          bloqueada: bloqueio ?? false,
        ),
        cliente: cliente == null
            ? null
            : ClienteEntity(
                nome: cliente!.nome,
                telefone: cliente!.celular,
              ),
        funcionarioAbertura: nomeFuncionarioAbertura == null
            ? null
            : PessoaEntity(
                codigo: 0,
                nome: nomeFuncionarioAbertura!,
              ),
        subTotal: valorItens ?? 0,
        couvert: cobrarCouvert ? valorCouvert : 0,
        gorjeta: valorServico,
        adiantamento: valorCreditos,
        couvertPorPessoa: couvertFixo == false,
        quantidadeDePessoas: quantidadePessoas,
        qrCodePix: qrCodePix,
      );
}
