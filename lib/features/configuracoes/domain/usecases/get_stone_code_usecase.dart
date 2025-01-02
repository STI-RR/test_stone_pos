import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStoneCodeUseCase implements UseCase<String, NoParams> {
  @override
  Future<Result<String>> call(NoParams params) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final stoneCode = sharedPreferences.getString('stoneCode');
    if (stoneCode != null) {
      return Result.success(stoneCode);
    } else {
      return Result.failure('Código Stone não encontrado');
    }
  }
}
