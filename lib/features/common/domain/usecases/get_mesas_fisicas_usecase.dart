import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/common/domain/entities/mesa_fisica_entity.dart';
import 'package:easyfood_app/features/common/domain/repositories/i_mesa_fisica_repository.dart';

class GetMesasFisicasUsecase implements UseCase<List<MesaFisicaEntity>, NoParams> {
  GetMesasFisicasUsecase(this._repository);

  final IMesaFisicaRepository _repository;

  @override
  Future<Result<List<MesaFisicaEntity>>> call(NoParams params) async {
    try {
      final result = await _repository.getMesasFisicas();
      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
