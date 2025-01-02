import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/common/domain/repositories/i_conta_repository.dart';

class FecharContaUseCase implements UseCase<void, FecharContaParams> {
  FecharContaUseCase(this._repository);

  final IContaRepository _repository;

  @override
  Future<Result<void>> call(FecharContaParams params) async {
    try {
      await _repository.fecharConta(
        params.idConta,
        funcionarioId: params.idFuncionario,
        quantidadePessoas: params.quantidadePessoas,
        categoriaImpressaoConta: params.idCategoriaImpressaoConta,
      );
      return Result.success(null);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class FecharContaParams {
  FecharContaParams({
    required this.idConta,
    required this.idFuncionario,
    this.quantidadePessoas = 1,
    this.idCategoriaImpressaoConta,
  });

  final int idConta;
  final int idFuncionario;
  final int quantidadePessoas;
  final int? idCategoriaImpressaoConta;
}
