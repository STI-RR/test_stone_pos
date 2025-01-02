import 'dart:isolate';

import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/configuracoes/domain/usecases/get_stone_code_usecase.dart';
import 'package:flutter/services.dart';

void ativaSdkStone() {
  _ativaSdk();
}

void _ativaSdk() async {
  final rootIsolateToken = ServicesBinding.rootIsolateToken;
  // final rootIsolateToken = RootIsolateToken.instance;
  if (rootIsolateToken == null) {
    return;
  }

  var stoneCode = await _getStoneCodeFromSharedPreferences();
  Isolate.run(() {
    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
    const methodChannel = MethodChannel('flavor');
    methodChannel.invokeMethod<String>('activateSdk', stoneCode);
  });
}

Future<String?> _getStoneCodeFromSharedPreferences() async {
  final useCase = GetStoneCodeUseCase();
  final result = await useCase.call(const NoParams());

  if (result.isSuccess) {
    return result.asSuccess!.value;
  } else {
    return null;
  }
}

enum Flavor {
  garcom,
  stone,
  pagSeguro;

  String valueName() {
    return toString().split('.').last;
  }
}
