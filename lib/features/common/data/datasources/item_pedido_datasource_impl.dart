import 'package:easyfood_app/features/common/data/datasources/dio_datasource.dart';
import 'package:easyfood_app/features/common/data/datasources/item_pedido_datasource.dart';
import 'package:easyfood_app/features/common/data/models/item_pedido_model_in.dart';

class ItemPedidoDataSourceImpl extends DioDataSource implements ItemPedidoDataSource {
  ItemPedidoDataSourceImpl(super._dio);

  @override
  Future<List<ItemPedidoModelIn>> getItensPorCodigoComanda(int comandaCodigo) async {
    var response = await getAsList(
      '/conta/itens2',
      queryParameters: {
        'cartao': comandaCodigo,
      },
    );
    return response.map((e) => ItemPedidoModelIn.fromJson(e)).toList();
  }

  @override
  Future<List<ItemPedidoModelIn>> getItensPorCodigoMesa(int mesaCodigo) async {
    var response = await getAsList(
      '/conta/itens2',
      queryParameters: {
        'mesa': mesaCodigo,
      },
    );
    return response.map((e) => ItemPedidoModelIn.fromJson(e)).toList();
  }

  @override
  Future<List<ItemPedidoModelIn>> getItensPorCodigoConta(int contaCodigo) async {
    var response = await getAsList(
      '/conta/itens2',
      queryParameters: {
        'conta': contaCodigo,
      },
    );
    return response.map((e) => ItemPedidoModelIn.fromJson(e)).toList();
  }
}
