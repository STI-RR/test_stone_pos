import 'dart:convert';
import 'dart:isolate';

import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';
import 'package:easyfood_app/features/detalhes_conta/model/entities/item_recibo_conta_pos_entity.dart';
import 'package:easyfood_app/features/detalhes_conta/model/entities/recibo_conta_pos_entity.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

class ImprimirContaPosUseCase implements UseCase<void, ImprimirContaPosParams> {
  @override
  Future<Result<void>> call(ImprimirContaPosParams params) async {
    try {
      final status = await Permission.storage.status;

      if (status.isGranted || await Permission.storage.request().isGranted) {
        Logger().d('Permissão de armazenamento concedida');
        final itens = _montarItens(params.conta.itensPedido);
        final reciboConta = ReciboContaPosEntity(
          descricao: getDescricaoConta(params.conta),
          codigo: params.conta.codigo,
          observacao: '',
          subTotal: params.conta.subTotal,
          tituloServico: params.tituloLabelServico,
          servico: params.conta.gorjeta ?? 0,
          cobrarCouvert: params.conta.couvert != null && params.conta.couvert! > 0,
          couvert: params.conta.couvert ?? 0,
          quantidadeDePessoas: params.quantidadePessoas,
          total: params.conta.totalCalculado,
          itens: itens,
          nomeEstabelecimento: params.nomeEstabelecimento,
          funcionario: params.nomeFuncionario,
          qrCodePixImageBase64: params.qrCodePixImageBase64,
        );
        final jsonString = jsonEncode(reciboConta.toJson());

        const channel = MethodChannel('flavor');

        RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
        Isolate.spawn((message) async {
          BackgroundIsolateBinaryMessenger.ensureInitialized(message);
          final print = await channel.invokeMethod<String>('print-conta', jsonString);
          Logger().d(print);
        }, rootIsolateToken);

        return Result.success(null);
      } else {
        if (await Permission.storage.isDenied) {
          await Permission.storage.request();
          return Result.failure('Permissão de armazenamento negada. Tente novamente');
        } else if (await Permission.storage.isPermanentlyDenied) {
          return Result.failure('Permissão de armazenamento negada. Habilite nas configurações do dispositivo');
        }

        return Result.failure('Permissão de armazenamento negada');
      }
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  List<ItemReciboContaPosEntity> _montarItens(List<ItemPedidoEntity> itensConta) {
    List<ItemReciboContaPosEntity> itens = [];

    for (var i in itensConta) {
      final newElement = ItemReciboContaPosEntity(
        descricao: i.descricao,
        quantidade: i.quantidade,
        precoUnitario: i.preco,
        precoVenda: i.preco * i.quantidade,
      );

      if (itens.contains(newElement)) {
        final index = itens.indexWhere((element) => element == newElement);
        final element = itens[index];
        itens[index] = element.copyWith(
          quantidade: element.quantidade + newElement.quantidade,
          precoVenda: element.precoVenda + newElement.precoVenda,
        );
      } else {
        itens.add(newElement);
      }
    }

    return itens;
  }

  String getDescricaoConta(ContaEntity conta) {
    if (conta is ContaMesaEntity) {
      return 'Mesa ${conta.mesa.codigo}';
    } else if (conta is ContaComandaEntity) {
      var descricao = 'COMANDA';
      // capitalize first letter
      descricao = descricao[0].toUpperCase() + descricao.substring(1);
      return '$descricao ${conta.comanda.codigo}';
    } else {
      return conta.descricao();
    }
  }
}

class ImprimirContaPosParams {
  final String nomeEstabelecimento;
  final String tituloLabelServico;
  final ContaEntity conta;
  final String nomeFuncionario;
  final int quantidadePessoas;
  final String? qrCodePixImageBase64;

  ImprimirContaPosParams({
    required this.nomeEstabelecimento,
    required this.tituloLabelServico,
    required this.conta,
    required this.nomeFuncionario,
    required this.quantidadePessoas,
    this.qrCodePixImageBase64,
  });
}
