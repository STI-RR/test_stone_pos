import 'package:easyfood_app/features/common/data/models/item_pedido_model_in.dart';

abstract interface class ItemPedidoDataSource {
  Future<List<ItemPedidoModelIn>> getItensPorCodigoComanda(int id);
  Future<List<ItemPedidoModelIn>> getItensPorCodigoMesa(int id);
  Future<List<ItemPedidoModelIn>> getItensPorCodigoConta(int contaId);
}
