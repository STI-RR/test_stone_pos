import 'package:easyfood_app/features/template/domain/entities/template_entity.dart';

abstract interface class ITemplateRepository {
  Future<TemplateEntity> getTemplate(int id);
}
