import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/template/domain/entities/template_entity.dart';
import 'package:easyfood_app/features/template/domain/repositories/i_template_repository.dart';

class GetTemplateUseCase implements UseCase<TemplateEntity, GetTemplateParams> {
  GetTemplateUseCase(this._repository);

  final ITemplateRepository _repository;

  @override
  Future<Result<TemplateEntity>> call(GetTemplateParams params) async {
    try {
      final result = await _repository.getTemplate(params.id);
      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class GetTemplateParams {
  const GetTemplateParams(this.id);

  final int id;
}
