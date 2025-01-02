import 'package:easyfood_app/core/usecases/result.dart';

abstract interface class UseCase<T, Params> {
  Future<Result<T>> call(Params params);
}

class NoParams {
  const NoParams();
}
