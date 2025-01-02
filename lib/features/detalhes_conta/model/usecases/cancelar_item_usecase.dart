import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/detalhes_conta/model/repositories/i_cancelamento_repository.dart';

class CancelarItemUseCase implements UseCase<void, CancelarItemUseCaseParams> {
  CancelarItemUseCase(this._repository);

  final ICancelamentoRepository _repository;

  @override
  Future<Result<void>> call(CancelarItemUseCaseParams params) async {
    try {
      await _repository.cancelarItem(
        idItem: params.idItem,
        idFuncionario: params.idFuncionario,
        idObservacao: params.observacao,
      );
      return Result.success(null);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class CancelarItemUseCaseParams {
  final int idItem;
  final int idFuncionario;
  final String observacao;

  CancelarItemUseCaseParams({
    required this.idItem,
    required this.idFuncionario,
    required this.observacao,
  });
}
