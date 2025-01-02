import 'package:easyfood_app/features/template/domain/entities/template_entity.dart';

class TemplateModelIn {
  dynamic property;

  TemplateModelIn({
    this.property,
  });

  TemplateEntity toEntity() {
    return TemplateEntity();
  }

  factory TemplateModelIn.fromJson(Map<String, dynamic> json) => TemplateModelIn();
}
