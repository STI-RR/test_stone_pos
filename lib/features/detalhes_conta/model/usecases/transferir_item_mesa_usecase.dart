import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/detalhes_conta/model/repositories/i_transferencia_repository.dart';

class TransferirItemMesaUseCase implements UseCase<void, TransferirItemMesaUseCaseParams> {
  TransferirItemMesaUseCase(this._repository);

  final ITransferenciaRepository _repository;

  @override
  Future<Result<void>> call(TransferirItemMesaUseCaseParams params) async {
    try {
      await _repository.transferirItemMesa(
        idMesaOrigem: params.idMesaOrigem,
        idMesaDestino: params.idMesaDestino,
        idItem: params.idItem,
        idFuncionario: params.idFuncionario,
      );
      return Result.success(null);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class TransferirItemMesaUseCaseParams {
  final int idMesaOrigem;
  final int idMesaDestino;
  final int idItem;
  final int idFuncionario;

  TransferirItemMesaUseCaseParams({
    required this.idMesaOrigem,
    required this.idMesaDestino,
    required this.idItem,
    required this.idFuncionario,
  });
}
