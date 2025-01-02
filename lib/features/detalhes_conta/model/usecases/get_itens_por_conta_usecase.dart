import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';
import 'package:easyfood_app/features/common/domain/repositories/i_item_pedido_repository.dart';

class GetItensPorContaUseCase implements UseCase<List<ItemPedidoEntity>, GetItensPorContaUseCaseParams> {
  GetItensPorContaUseCase(this._repository);

  final IItemPedidoRepository _repository;

  @override
  Future<Result<List<ItemPedidoEntity>>> call(GetItensPorContaUseCaseParams params) async {
    try {
      final result = await _repository.getItensPorCodigoConta(params.contaId);
      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class GetItensPorContaUseCaseParams {
  final int contaId;

  GetItensPorContaUseCaseParams({required this.contaId});
}
