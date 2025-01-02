import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:flutter/services.dart';

class CancelarPagamentoUseCase implements UseCase<void, NoParams> {
  @override
  Future<Result<void>> call(NoParams params) {
    const channel = MethodChannel('flavor');
    channel.invokeMethod<String>('cancel-pay');
    return Future.value(Result.success(null));
  }
}
