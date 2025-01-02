import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';

abstract interface class IItemPedidoRepository {
  Future<List<ItemPedidoEntity>> getItensPorCodigoMesa(int mesaCodigo);
  Future<List<ItemPedidoEntity>> getItensPorCodigoComanda(int comandaCodigo);
  Future<List<ItemPedidoEntity>> getItensPorCodigoConta(int contaId);
}
