import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveStoneCodeUseCase implements UseCase<void, SaveStoneCodeUseCaseParams> {
  @override
  Future<Result<void>> call(SaveStoneCodeUseCaseParams params) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('stoneCode', params.stoneCode);
    return Result.success(null);
  }
}

class SaveStoneCodeUseCaseParams {
  final String stoneCode;

  SaveStoneCodeUseCaseParams(this.stoneCode);
}
