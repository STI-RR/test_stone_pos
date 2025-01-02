import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/detalhes_conta/model/entities/credito_entity.dart';
import 'package:easyfood_app/features/detalhes_conta/model/repositories/i_credito_repository.dart';

class GetCreditosContaUseCase implements UseCase<List<CreditoEntity>, GetCreditosContaUseCaseParams> {
  final ICreditoRepository _repository;

  GetCreditosContaUseCase(this._repository);

  @override
  Future<Result<List<CreditoEntity>>> call(GetCreditosContaUseCaseParams params) async {
    try {
      final creditos = await _repository.getCreditosConta(params.idConta);
      return Result.success(creditos);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class GetCreditosContaUseCaseParams {
  final int idConta;

  GetCreditosContaUseCaseParams({required this.idConta});
}
