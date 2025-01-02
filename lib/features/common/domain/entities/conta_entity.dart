import 'package:easyfood_app/features/common/domain/entities/cliente_entity.dart';
import 'package:easyfood_app/features/common/domain/entities/comanda_entity.dart';
import 'package:easyfood_app/features/common/domain/entities/endereco_entity.dart';
import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';
import 'package:easyfood_app/features/common/domain/entities/pessoa_entity.dart';
import 'package:easyfood_app/features/common/domain/entities/status_comanda.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/mesa_entity.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/status_mesa.dart';

sealed class ContaEntity {
  int codigo;
  TipoConta tipo;
  String? senha;
  DateTime dataHoraAbertura;
  DateTime? dataHoraPagamento;
  List<ItemPedidoEntity> itensPedido;
  ClienteEntity? cliente;
  String? nomeClientePraViagem;
  PessoaEntity? funcionarioAbertura;
  double subTotal;
  double? couvert;
  int? usuarioRemocaoCouvert;
  double? gorjeta;
  int? usuarioRemocaoGorjeta;
  double? adiantamento;
  int quantidadeDePessoas;
  String? qrCodePix;

  ContaEntity({
    required this.codigo,
    required this.tipo,
    this.senha,
    required this.dataHoraAbertura,
    this.dataHoraPagamento,
    required this.itensPedido,
    this.cliente,
    this.nomeClientePraViagem,
    this.funcionarioAbertura,
    required this.subTotal,
    this.couvert,
    this.gorjeta,
    this.adiantamento,
    this.qrCodePix,
    int? quantidadeDePessoas,
  }) : quantidadeDePessoas = quantidadeDePessoas ?? 1;

  double get totalCalculado => subTotal + (couvert ?? 0) + (gorjeta ?? 0) - (adiantamento ?? 0);

  bool get podeAdicionarItem;
  bool get podePagar;

  String descricao() {
    return 'Conta $codigo';
  }
}

enum TipoConta {
  mesa('Mesa'),
  comanda('Cartão'),
  viagem('P/ Viagem'),
  delivery('Delivery'),
  ficha('Ficha'),
  fastFood('Fast Food'),
  iFood('iFood'),
  deliveryApp('App Delivery'),
  pigz('Pigz'),
  totem('Totem'),
  totemQrCode('Totem QR Code');

  final String descricao;

  const TipoConta(this.descricao);
}

class ContaMesaEntity extends ContaEntity {
  MesaEntity mesa;
  bool couvertPorPessoa;

  ContaMesaEntity({
    required super.codigo,
    super.senha,
    required super.dataHoraAbertura,
    super.dataHoraPagamento,
    required super.itensPedido,
    super.cliente,
    super.funcionarioAbertura,
    required super.subTotal,
    super.couvert,
    super.gorjeta,
    super.adiantamento,
    super.qrCodePix,
    super.quantidadeDePessoas,
    required this.mesa,
    required this.couvertPorPessoa,
  }) : super(tipo: TipoConta.mesa);

  @override
  String descricao() {
    return 'Mesa ${mesa.codigo}';
  }

  @override
  bool get podeAdicionarItem => mesa.status != StatusMesa.fechamento;
  @override
  bool get podePagar => true;
  @override
  double? get couvert {
    if (super.couvert != null) {
      return couvertPorPessoa ? super.couvert! * quantidadeDePessoas : super.couvert;
    }
    return null;
  }
}

class ContaComandaEntity extends ContaEntity {
  ComandaEntity comanda;
  bool couvertPorPessoa;

  ContaComandaEntity({
    required super.codigo,
    super.senha,
    required super.dataHoraAbertura,
    super.dataHoraPagamento,
    required super.itensPedido,
    super.cliente,
    super.funcionarioAbertura,
    required super.subTotal,
    super.couvert,
    super.gorjeta,
    super.adiantamento,
    super.qrCodePix,
    super.quantidadeDePessoas,
    required this.comanda,
    required this.couvertPorPessoa,
  }) : super(tipo: TipoConta.comanda);

  @override
  String descricao() {
    return 'Comanda ${comanda.codigo}';
  }

  @override
  bool get podeAdicionarItem => comanda.status != StatusComanda.fechamento;
  @override
  bool get podePagar => true;
  @override
  double? get couvert {
    if (super.couvert != null) {
      return couvertPorPessoa ? super.couvert! * quantidadeDePessoas : super.couvert;
    }
    return null;
  }
}

class ContaFichaEntity extends ContaEntity {
  ContaFichaEntity({
    required super.codigo,
    super.senha,
    required super.dataHoraAbertura,
    super.dataHoraPagamento,
    required super.itensPedido,
    super.cliente,
    super.funcionarioAbertura,
    required super.subTotal,
    super.couvert,
    super.gorjeta,
    super.adiantamento,
    super.qrCodePix,
  }) : super(tipo: TipoConta.ficha);

  @override
  String descricao() {
    return 'Ficha $codigo';
  }

  @override
  bool get podeAdicionarItem => false;
  @override
  bool get podePagar => true;
}

class ContaFastFoodEntity extends ContaEntity {
  ContaFastFoodEntity({
    required super.codigo,
    super.senha,
    required super.dataHoraAbertura,
    super.dataHoraPagamento,
    required super.itensPedido,
    super.cliente,
    super.funcionarioAbertura,
    required super.subTotal,
    super.couvert,
    super.gorjeta,
    super.adiantamento,
    super.qrCodePix,
  }) : super(tipo: TipoConta.fastFood);

  @override
  String descricao() {
    return 'Fast Food $senha';
  }

  @override
  bool get podeAdicionarItem => dataHoraPagamento == null;
  @override
  bool get podePagar => true;
}

class ContaTotemEntity extends ContaEntity {
  ContaTotemEntity({
    required super.codigo,
    super.senha,
    required super.dataHoraAbertura,
    super.dataHoraPagamento,
    required super.itensPedido,
    super.cliente,
    super.funcionarioAbertura,
    required super.subTotal,
    super.couvert,
    super.gorjeta,
    super.adiantamento,
    super.qrCodePix,
  }) : super(tipo: TipoConta.totem);

  @override
  String descricao() {
    return 'Totem $senha';
  }

  @override
  bool get podeAdicionarItem => dataHoraPagamento == null;
  @override
  bool get podePagar => true;
}

class ContaTotemQrCodeEntity extends ContaEntity {
  ContaTotemQrCodeEntity({
    required super.codigo,
    super.senha,
    required super.dataHoraAbertura,
    super.dataHoraPagamento,
    required super.itensPedido,
    super.cliente,
    super.funcionarioAbertura,
    required super.subTotal,
    super.couvert,
    super.gorjeta,
    super.adiantamento,
    super.qrCodePix,
  }) : super(tipo: TipoConta.totemQrCode);

  @override
  String descricao() {
    return 'Totem QrCode $senha';
  }

  @override
  bool get podeAdicionarItem => dataHoraPagamento == null;
  @override
  bool get podePagar => true;
}

class ContaDeliveryEntity extends ContaEntity {
  DateTime? dataHoraSaidaEntrega;
  EnderecoEntity? enderecoEntrega;

  ContaDeliveryEntity({
    required super.codigo,
    super.senha,
    required super.dataHoraAbertura,
    super.dataHoraPagamento,
    required super.itensPedido,
    super.cliente,
    super.funcionarioAbertura,
    required super.subTotal,
    super.couvert,
    super.gorjeta,
    super.adiantamento,
    super.qrCodePix,
    required super.tipo,
    this.dataHoraSaidaEntrega,
    this.enderecoEntrega,
  });

  @override
  String descricao() {
    switch (tipo) {
      case TipoConta.delivery:
        return 'Delivery $senha';
      case TipoConta.iFood:
        return 'iFood $senha';
      case TipoConta.deliveryApp:
        return 'DeliveryApp $senha';
      case TipoConta.pigz:
        return 'Pigz $senha';
      default:
        return 'Conta $codigo';
    }
  }

  @override
  bool get podeAdicionarItem => dataHoraSaidaEntrega == null;
  @override
  bool get podePagar => dataHoraSaidaEntrega != null;
}

class ContaPraViagemEntity extends ContaEntity {
  ContaPraViagemEntity({
    required super.codigo,
    super.senha,
    required super.dataHoraAbertura,
    super.dataHoraPagamento,
    required super.itensPedido,
    super.cliente,
    required super.nomeClientePraViagem,
    super.funcionarioAbertura,
    required super.subTotal,
    super.couvert,
    super.gorjeta,
    super.adiantamento,
    super.qrCodePix,
  }) : super(tipo: TipoConta.viagem);

  @override
  String descricao() {
    return 'Pra viagem $senha';
  }

  @override
  bool get podeAdicionarItem => dataHoraPagamento == null;
  @override
  bool get podePagar => true;
}
