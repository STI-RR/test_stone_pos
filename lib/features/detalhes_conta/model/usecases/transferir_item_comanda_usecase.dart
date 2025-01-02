import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/detalhes_conta/model/repositories/i_transferencia_repository.dart';

class TransferirItemComandaUseCase implements UseCase<void, TransferirItemComandaUseCaseParams> {
  TransferirItemComandaUseCase(this._repository);

  final ITransferenciaRepository _repository;

  @override
  Future<Result<void>> call(TransferirItemComandaUseCaseParams params) async {
    try {
      await _repository.transferirItemComanda(
        idComandaOrigem: params.idComandaOrigem,
        idComandaDestino: params.idComandaDestino,
        idItem: params.idItem,
        idFuncionario: params.idFuncionario,
      );
      return Result.success(null);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class TransferirItemComandaUseCaseParams {
  final int idComandaOrigem;
  final int idComandaDestino;
  final int idItem;
  final int idFuncionario;

  TransferirItemComandaUseCaseParams({
    required this.idComandaOrigem,
    required this.idComandaDestino,
    required this.idItem,
    required this.idFuncionario,
  });
}
