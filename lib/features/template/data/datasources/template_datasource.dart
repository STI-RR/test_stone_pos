import 'package:easyfood_app/features/template/data/models/template_model_in.dart';

abstract interface class TemplateDataSource {
  Future<TemplateModelIn> getTemplate(int id);
}
