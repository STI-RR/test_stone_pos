import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/features/template/data/datasources/template_datasource.dart';
import 'package:easyfood_app/features/template/domain/entities/template_entity.dart';
import 'package:easyfood_app/features/template/domain/repositories/i_template_repository.dart';

class TemplateRepositoryImpl implements ITemplateRepository {
  TemplateRepositoryImpl(this._dataSource);

  final TemplateDataSource _dataSource;

  @override
  Future<TemplateEntity> getTemplate(int id) async {
    try {
      final modelIn = await _dataSource.getTemplate(id);
      return modelIn.toEntity();
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}
