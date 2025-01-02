import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/mesa_entity.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/repositories/i_mesa_repository.dart';

class GetMesaUseCase implements UseCase<MesaEntity, GetMesaUseCaseParams> {
  GetMesaUseCase(this._repository);

  final IMesaRepository _repository;

  @override
  Future<Result<MesaEntity>> call(GetMesaUseCaseParams params) async {
    try {
      final result = await _repository.getMesa(params.id);
      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class GetMesaUseCaseParams {
  final int id;

  GetMesaUseCaseParams({
    required this.id,
  });
}
