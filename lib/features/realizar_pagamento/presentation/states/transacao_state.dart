import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/login/domain/entities/usuario_entity.dart';
import 'package:easyfood_app/features/realizar_pagamento/domain/entities/atualizacao_pagamento_entity.dart';
import 'package:easyfood_app/features/realizar_pagamento/domain/entities/conclusao_pagamento_entity.dart';
import 'package:easyfood_app/features/realizar_pagamento/domain/entities/requisicao_pagamento_entity.dart';
import 'package:easyfood_app/features/realizar_pagamento/domain/usecases/cancelar_pagamento_usecase.dart';
import 'package:easyfood_app/features/realizar_pagamento/domain/usecases/imprimir_via_pagamento_cliente_usecase.dart';
import 'package:easyfood_app/features/realizar_pagamento/domain/usecases/realizar_pagamento_usecase.dart';
import 'package:easyfood_app/features/realizar_pagamento/presentation/pages/transacao_page_params.dart';
import 'package:easyfood_app/features/transacoes/domain/entities/status_tipo_pagamento_transacao_entity.dart';
import 'package:easyfood_app/flutter_method_channel.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:uuid/uuid.dart';

class TransacaoState extends ChangeNotifier implements FlutterMethodChannelPaymentListener {
  String mainText = 'Aguardando pagamento';
  String secondaryText = '';
  bool isPaymentComplete = false;
  bool isPaymentSuccess = false;
  bool _transactionReceiptPrinted = false;
  final TransacaoPageParams requestParams;
  RequisicaoPagamentoEntity? paymentRequest;
  String? qrCodePix;
  UsuarioEntity usuario;

  get showButtonPrintTransactionReceipt =>
      _transactionReceiptPrinted == false &&
      isPaymentComplete &&
      isPaymentSuccess &&
      requestParams.formaDePagamento != StatusTipoPagamentoTransacaoEntity.easyFoodCash;

  TransacaoState(this.requestParams, this.usuario) {
    _createPaymentRequest();

    if (requestParams.formaDePagamento == StatusTipoPagamentoTransacaoEntity.easyFoodCash) {
      Future.delayed(const Duration(seconds: 1), () {
        onPaymentComplete(ConclusaoPagamentoEntity(
          success: true,
          acquirer: 'EASYFOOD',
          cardBrand: '',
          transactionTime: DateTime.now().millisecondsSinceEpoch,
          atk: const Uuid().v4(),
          deviceSerial: '',
          successMessage: 'APPROVED',
          authorizeMessage: 'Pagamento em dinheiro aprovado',
          errorMessage: '',
        ));
      });
    } else {
      FlutterMethodChannel.instance.addPaymentListener(this);
      _initTransaction();
    }
  }

  void _createPaymentRequest() {
    const String estabelecimento = 'TESTE';
    paymentRequest = RequisicaoPagamentoEntity(
      valorEmCentavos: requestParams.valorEmCentavos,
      formaDePagamento: requestParams.formaDePagamento.value.split('_').last,
      sku: 'Conta ${requestParams.codigoConta} em $estabelecimento',
      imprimirViaEstabelecimento: true,
    );
  }

  @override
  void dispose() {
    FlutterMethodChannel.instance.removePaymentListener(this);
    super.dispose();
  }

  void _initTransaction() {
    const String estabelecimento = 'TESTE';
    const bool imprimirViaEstabelecimento = true;

    final useCase = RealizarPagamentoUseCase();
    final useCaseParams = RealizarPagamentoParams(
      valorEmCentavos: requestParams.valorEmCentavos,
      formaDePagamento: requestParams.formaDePagamento,
      sku: 'Conta ${requestParams.codigoConta} em $estabelecimento',
      imprimirViaEstabelecimento: imprimirViaEstabelecimento,
    );
    useCase(useCaseParams);
  }

  @override
  void onPaymentUpdate(AtualizacaoPagamentoEntity update) {
    if (requestParams.formaDePagamento.value.contains('pix')) {
      final base64QrCode =
          update.descricaoEvento.replaceAll("\n", "").replaceAll("\r", "").replaceAll("\\/", "").replaceAll(" ", "");
      if (isBase64(base64QrCode)) {
        qrCodePix = base64QrCode;
        mainText = 'Pagamento via PIX';
        notifyListeners();
        return;
      }
    }

    mainText = update.descricaoEvento;
    notifyListeners();
  }

  @override
  void onPaymentComplete(ConclusaoPagamentoEntity result) {
    isPaymentSuccess = result.success;
    mainText = result.success ? 'Pagamento realizado com sucesso' : 'Pagamento não realizado';
    secondaryText = result.authorizeMessage ?? result.errorMessage ?? '';
    notifyListeners();
  }

  void printTransactionReceipt() {
    _transactionReceiptPrinted = true;
    notifyListeners();

    final useCase = ImprimirViaPagamentoClienteUsecase();
    useCase(const NoParams());
  }

  void cancelPayment() {
    final useCase = CancelarPagamentoUseCase();
    useCase(const NoParams());
  }
}
