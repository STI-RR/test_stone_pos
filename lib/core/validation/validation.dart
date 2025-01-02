import 'package:easyfood_app/core/validation/validation_result.dart';

abstract interface class Validation<T> {
  ValidationResult validate(T toValidate);
}
