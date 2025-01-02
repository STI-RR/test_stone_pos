// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_pedido_model_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemPedidoModelIn _$ItemPedidoModelInFromJson(Map<String, dynamic> json) =>
    ItemPedidoModelIn(
      status: json['status'] as String,
      codigo: (json['codigo'] as num).toInt(),
      quantidade: (json['quantidade'] as num).toInt(),
      descricao: json['descricao'] as String,
      observacao: json['observacao'] as String,
      promocao: json['promocao'] as String,
      precoVenda: (json['precoVenda'] as num).toDouble(),
      nomeFuncionario: json['nomeFuncionario'] as String?,
      dataHoraPedido: (json['dataHoraPedido'] as num).toInt(),
      imprimir: json['imprimir'] as String,
      precoUnitario: (json['precoUnitario'] as num).toDouble(),
      codConta: (json['codConta'] as num).toInt(),
      codMesa: (json['codMesa'] as num?)?.toInt(),
      codCartao: (json['codCartao'] as num?)?.toInt(),
      cobrarServico: json['cobrarServico'] as bool,
      imprimirFichaPos: json['imprimirFichaPos'] as bool,
    )..peso = (json['peso'] as num?)?.toDouble();

Map<String, dynamic> _$ItemPedidoModelInToJson(ItemPedidoModelIn instance) =>
    <String, dynamic>{
      'status': instance.status,
      'codigo': instance.codigo,
      'quantidade': instance.quantidade,
      'peso': instance.peso,
      'descricao': instance.descricao,
      'observacao': instance.observacao,
      'promocao': instance.promocao,
      'precoVenda': instance.precoVenda,
      'nomeFuncionario': instance.nomeFuncionario,
      'dataHoraPedido': instance.dataHoraPedido,
      'imprimir': instance.imprimir,
      'precoUnitario': instance.precoUnitario,
      'codConta': instance.codConta,
      'codMesa': instance.codMesa,
      'codCartao': instance.codCartao,
      'cobrarServico': instance.cobrarServico,
      'imprimirFichaPos': instance.imprimirFichaPos,
    };
