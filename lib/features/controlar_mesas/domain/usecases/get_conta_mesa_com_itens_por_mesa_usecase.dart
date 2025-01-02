import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/common/domain/repositories/i_item_pedido_repository.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/repositories/i_conta_mesa_repository.dart';

class GetContaMesaComItensPorMesaUseCase
    implements UseCase<ContaMesaEntity?, GetContaMesaComItensPorMesaUseCaseParams> {
  final IContaMesaRepository contaRepository;
  final IItemPedidoRepository itemPedidoRepository;

  GetContaMesaComItensPorMesaUseCase(this.contaRepository, this.itemPedidoRepository);

  @override
  Future<Result<ContaMesaEntity?>> call(GetContaMesaComItensPorMesaUseCaseParams params) async {
    try {
      final conta = await contaRepository.findByMesaCodigo(params.mesaId);
      if (conta == null) {
        return Result.success(null);
      }

      final itens = await itemPedidoRepository.getItensPorCodigoMesa(params.mesaId);
      conta.itensPedido = itens;

      return Result.success(conta);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class GetContaMesaComItensPorMesaUseCaseParams {
  final int mesaId;

  GetContaMesaComItensPorMesaUseCaseParams({required this.mesaId});
}
