import 'package:easyfood_app/core/validation/validation_result.dart';

abstract class ValidationStep<T> {
  ValidationStep<T>? _next;

  ValidationStep<T> linkWith(ValidationStep<T> next) {
    if (_next == null) {
      _next = next;
      return this;
    }
    ValidationStep? lastStep = this._next;
    while (lastStep?._next != null) {
      lastStep = lastStep?._next;
    }
    lastStep?._next = next;
    return this;
  }

  ValidationResult validate(T toValidate);

  ValidationResult validateNext(T toValidate) {
    if (_next == null) {
      return ValidationResult.valid();
    } else {
      return _next!.validate(toValidate);
    }
  }
}
