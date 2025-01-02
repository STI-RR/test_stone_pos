import 'dart:convert';
import 'dart:isolate';

import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/imprimir_ficha/domain/entities/item_ficha_impressao_entity.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

class ImprimirFichaPosUseCase implements UseCase<void, ImprimirFichaPosParams> {
  @override
  Future<Result<void>> call(ImprimirFichaPosParams params) async {
    try {
      if (await Permission.storage.request().isGranted) {
        Logger().d('Permissão de armazenamento concedida');
        final jsonString = jsonEncode(params.item.toJson());

        const channel = MethodChannel('flavor');

        RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
        Isolate.spawn((message) async {
          BackgroundIsolateBinaryMessenger.ensureInitialized(message);
          final print = await channel.invokeMethod<String>('print-ficha', jsonString);
          Logger().d(print);
        }, rootIsolateToken);

        return Result.success(null);
      } else {
        return Result.failure('Permissão de armazenamento negada');
      }
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class ImprimirFichaPosParams {
  final ItemFichaImpressaoEntity item;

  ImprimirFichaPosParams({
    required this.item,
  });
}
