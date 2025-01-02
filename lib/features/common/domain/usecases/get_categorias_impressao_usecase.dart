import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/common/domain/entities/categoria_impressao_entity.dart';
import 'package:easyfood_app/features/common/domain/repositories/i_categoria_impressao_repository.dart';

class GetCategoriasImpressaoUseCase implements UseCase<List<CategoriaImpressaoEntity>, NoParams> {
  GetCategoriasImpressaoUseCase(this._repository);

  final ICategoriaImpressaoRepository _repository;

  @override
  Future<Result<List<CategoriaImpressaoEntity>>> call(NoParams params) async {
    try {
      final result = await _repository.getCategoriasImpressao();
      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
