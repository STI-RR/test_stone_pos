sealed class Result<T> {
  const Result();

  factory Result.success(T value) = Success<T>;
  factory Result.failure(String message) = Failure<T>;

  bool get isSuccess => this is Success<T>;

  bool get isFailure => this is Failure<T>;

  Success<T>? get asSuccess => this is Success<T> ? this as Success<T> : null;

  Failure<T>? get asFailure => this is Failure<T> ? this as Failure<T> : null;
}

class Success<T> extends Result<T> {
  final T value;

  const Success(this.value);
}

class Failure<T> extends Result<T> {
  final String message;

  const Failure(this.message);
}
