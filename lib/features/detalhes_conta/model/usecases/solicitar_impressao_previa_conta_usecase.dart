import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/common/domain/repositories/i_conta_repository.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class SolicitarImpressaoPreviaContaUseCase implements UseCase<void, SolicitarImpressaoPreviaContaUseCaseParams> {
  SolicitarImpressaoPreviaContaUseCase(this._repository);

  final IContaRepository _repository;

  @override
  Future<Result<void>> call(SolicitarImpressaoPreviaContaUseCaseParams params) async {
    try {
      const channel = MethodChannel('flavor');
      Logger().d('Solicitar impressão prévia da conta');
      final print = await channel.invokeMethod<String>('print');
      Logger().d(print);

      return Result.success(null);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class SolicitarImpressaoPreviaContaUseCaseParams {
  final int contaId;
  final int funcionarioId;
  final int quantidadePessoas;

  SolicitarImpressaoPreviaContaUseCaseParams({
    required this.contaId,
    required this.funcionarioId,
    required this.quantidadePessoas,
  });
}
