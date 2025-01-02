import 'package:easyfood_app/core/exception/validation_exception.dart';
import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/detalhes_conta/model/repositories/i_transferencia_repository.dart';

class TransferirComandaUseCase implements UseCase<void, TransferirComandaUseCaseParams> {
  TransferirComandaUseCase(this._repository);

  final ITransferenciaRepository _repository;

  @override
  Future<Result<void>> call(TransferirComandaUseCaseParams params) async {
    try {
      await _repository.transferirComanda(
        idComandaOrigem: params.idComandaOrigem,
        idComandaDestino: params.idComandaDestino,
        idFuncionario: params.idFuncionario,
      );
      return Result.success(null);
    } on ValidationException {
      rethrow;
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class TransferirComandaUseCaseParams {
  final int idComandaOrigem;
  final int idComandaDestino;
  final int idFuncionario;

  TransferirComandaUseCaseParams({
    required this.idComandaOrigem,
    required this.idComandaDestino,
    required this.idFuncionario,
  });
}
