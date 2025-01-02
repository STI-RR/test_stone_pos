import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/mesa_entity.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/repositories/i_mesa_repository.dart';

class GetMesasUseCase implements UseCase<List<MesaEntity>, NoParams> {
  GetMesasUseCase(this._repository);

  final IMesaRepository _repository;

  @override
  Future<Result<List<MesaEntity>>> call(NoParams params) async {
    try {
      final result = await _repository.getMesas();
      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
