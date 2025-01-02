import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';
import 'package:easyfood_app/features/common/domain/repositories/i_item_pedido_repository.dart';

class GetItensPedidoUseCase implements UseCase<List<ItemPedidoEntity>, GetItemPedidoParams> {
  GetItensPedidoUseCase(this._repository);

  final IItemPedidoRepository _repository;

  @override
  Future<Result<List<ItemPedidoEntity>>> call(GetItemPedidoParams params) async {
    try {
      final result = await _repository.getItensPorCodigoConta(params.contaId);
      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class GetItemPedidoParams {
  const GetItemPedidoParams({required this.contaId});

  final int contaId;
}
