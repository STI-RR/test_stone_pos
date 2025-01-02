import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/common/domain/entities/cliente_entity.dart';

class SaveClienteMesaOuComandaUseCase implements UseCase<ClienteEntity, SaveClienteMesaOuComandaUseCaseParams> {
  SaveClienteMesaOuComandaUseCase();

  @override
  Future<Result<ClienteEntity>> call(SaveClienteMesaOuComandaUseCaseParams params) async {
    try {
      throw Exception('Mesa ou cartão não informado');
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class SaveClienteMesaOuComandaUseCaseParams {
  final ClienteEntity cliente;
  final int? mesa;
  final int? cartao;

  SaveClienteMesaOuComandaUseCaseParams({
    required this.cliente,
    this.mesa,
    this.cartao,
  }) : assert(mesa != null || cartao != null);
}
