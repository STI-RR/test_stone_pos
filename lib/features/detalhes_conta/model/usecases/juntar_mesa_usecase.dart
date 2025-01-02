import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/detalhes_conta/model/repositories/i_juncao_repository.dart';

class JuntarMesaUseCase implements UseCase<void, JuntarMesaUseCaseParams> {
  JuntarMesaUseCase(this._repository);

  final IJuncaoRepository _repository;

  @override
  Future<Result<void>> call(JuntarMesaUseCaseParams params) async {
    try {
      await _repository.juntarMesa(
        idMesaOrigem: params.idMesaOrigem,
        idMesaDestino: params.idMesaDestino,
        idFuncionario: params.idFuncionario,
      );
      return Result.success(null);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class JuntarMesaUseCaseParams {
  final int idMesaOrigem;
  final int idMesaDestino;
  final int idFuncionario;

  JuntarMesaUseCaseParams({
    required this.idMesaOrigem,
    required this.idMesaDestino,
    required this.idFuncionario,
  });
}
