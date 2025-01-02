import 'dart:convert';

import 'package:easyfood_app/features/realizar_pagamento/domain/entities/atualizacao_pagamento_entity.dart';
import 'package:easyfood_app/features/realizar_pagamento/domain/entities/conclusao_pagamento_entity.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class FlutterMethodChannel {
  // this channel name needs to match the one in Native method channel
  static const _channelName = 'br.com.stirr.easyfood.app.easyfood_app/native';
  MethodChannel? methodChannel;
  static final List<FlutterMethodChannelPrintListener> _printListeners = [];
  void addPrintListener(FlutterMethodChannelPrintListener listener) {
    Logger().i('Adding print listener.');
    _printListeners.add(listener);
  }

  void removePrintListener(FlutterMethodChannelPrintListener listener) {
    Logger().i('Removing print listener.');
    _printListeners.remove(listener);
  }

  static final List<FlutterMethodChannelPaymentListener> _paymentListeners = [];
  void addPaymentListener(FlutterMethodChannelPaymentListener listener) {
    Logger().i('Adding payment listener.');
    _paymentListeners.add(listener);
  }

  void removePaymentListener(FlutterMethodChannelPaymentListener listener) {
    Logger().i('Removing payment listener.');
    _paymentListeners.remove(listener);
  }

  static final FlutterMethodChannel instance = FlutterMethodChannel._init();

  FlutterMethodChannel._init();

  void configureChannel() {
    methodChannel = const MethodChannel(_channelName);
    methodChannel?.setMethodCallHandler(_methodHandler);
  }

  Future<void> _methodHandler(MethodCall call) async {
    switch (call.method) {
      case 'printSuccess':
        Logger().i('Print success. Notifying ${_printListeners.length} listeners.');
        for (var listener in _printListeners) {
          listener.onPrintSuccess.call();
        }
        break;
      case 'printError':
        Logger().e('Print error: ${call.arguments}. Notifying ${_printListeners.length} listeners.');
        for (var listener in _printListeners) {
          listener.onPrintError.call(call.arguments);
        }
        break;
      case 'paymentUpdate':
        Logger().i('Payment update: ${call.arguments}. Notifying ${_paymentListeners.length} listeners.');
        final json = jsonDecode(call.arguments as String);
        final update = AtualizacaoPagamentoEntity.fromJson(json);
        for (var listener in _paymentListeners) {
          listener.onPaymentUpdate(update);
        }
        break;
      case 'paymentComplete':
        Logger().i('Payment complete: ${call.arguments}. Notifying ${_paymentListeners.length} listeners.');
        final json = jsonDecode(call.arguments as String);
        final result = ConclusaoPagamentoEntity.fromJson(json);
        for (var listener in _paymentListeners) {
          listener.onPaymentComplete(result);
        }
        break;
      default:
        throw MissingPluginException();
    }
  }
}

abstract interface class FlutterMethodChannelPrintListener {
  void onPrintSuccess();
  void onPrintError(String message);
}

abstract interface class FlutterMethodChannelPaymentListener {
  void onPaymentUpdate(AtualizacaoPagamentoEntity update);
  void onPaymentComplete(ConclusaoPagamentoEntity result);
}
