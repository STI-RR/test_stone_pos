import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:flutter/services.dart';

class GetFlavorInfoUseCase implements UseCase<String, NoParams> {
  @override
  Future<Result<String>> call(NoParams params) async {
    try {
      const channel = MethodChannel('flavor');
      final info = await channel.invokeMethod<String>('get-flavor-info');
      return Result.success(info ?? '');
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
