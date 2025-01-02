import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/detalhes_conta/model/repositories/i_juncao_repository.dart';

class JuntarComandaUseCase implements UseCase<void, JuntarComandaUseCaseParams> {
  JuntarComandaUseCase(this._repository);

  final IJuncaoRepository _repository;

  @override
  Future<Result<void>> call(JuntarComandaUseCaseParams params) async {
    try {
      await _repository.juntarComanda(
        idComandaOrigem: params.idComandaOrigem,
        idComandaDestino: params.idComandaDestino,
        idFuncionario: params.idFuncionario,
      );
      return Result.success(null);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class JuntarComandaUseCaseParams {
  final int idComandaOrigem;
  final int idComandaDestino;
  final int idFuncionario;

  JuntarComandaUseCaseParams({
    required this.idComandaOrigem,
    required this.idComandaDestino,
    required this.idFuncionario,
  });
}
