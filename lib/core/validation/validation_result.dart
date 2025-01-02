class ValidationResult {
  final bool _isValid;
  final String? _errorMessage;

  ValidationResult._(this._isValid, this._errorMessage);

  factory ValidationResult.valid() => ValidationResult._(true, null);
  factory ValidationResult.invalid(String message) => ValidationResult._(false, message);

  bool get isValid => _isValid;
  bool get isInvalid => !_isValid;
  String? get message => _errorMessage;
}
