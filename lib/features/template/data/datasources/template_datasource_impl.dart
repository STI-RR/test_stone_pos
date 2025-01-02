import 'package:easyfood_app/features/common/data/datasources/dio_datasource.dart';
import 'package:easyfood_app/features/template/data/datasources/template_datasource.dart';
import 'package:easyfood_app/features/template/data/models/template_model_in.dart';

class TemplateDataSourceImpl extends DioDataSource implements TemplateDataSource {
  TemplateDataSourceImpl(super._dio);

  @override
  Future<TemplateModelIn> getTemplate(int id) {
    return get('/template/$id').then((value) => TemplateModelIn.fromJson(value));
  }
}
