import 'package:easyfood_app/core/exception/validation_exception.dart';
import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/detalhes_conta/model/repositories/i_transferencia_repository.dart';

class TransferirMesaUseCase implements UseCase<void, TransferirMesaUseCaseParams> {
  TransferirMesaUseCase(this._repository);

  final ITransferenciaRepository _repository;

  @override
  Future<Result<void>> call(TransferirMesaUseCaseParams params) async {
    try {
      await _repository.transferirMesa(
        idMesaOrigem: params.idMesaOrigem,
        idMesaDestino: params.idMesaDestino,
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

class TransferirMesaUseCaseParams {
  final int idMesaOrigem;
  final int idMesaDestino;
  final int idFuncionario;

  TransferirMesaUseCaseParams({
    required this.idMesaOrigem,
    required this.idMesaDestino,
    required this.idFuncionario,
  });
}
