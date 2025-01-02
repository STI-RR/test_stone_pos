import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/features/common/data/datasources/item_pedido_datasource.dart';
import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';
import 'package:easyfood_app/features/common/domain/repositories/i_item_pedido_repository.dart';

class ItemPedidoRepositoryImpl implements IItemPedidoRepository {
  ItemPedidoRepositoryImpl(this._dataSource);

  final ItemPedidoDataSource _dataSource;

  @override
  Future<List<ItemPedidoEntity>> getItensPorCodigoComanda(int comandaCodigo) async {
    try {
      final modelIn = await _dataSource.getItensPorCodigoComanda(comandaCodigo);
      return modelIn.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }

  @override
  Future<List<ItemPedidoEntity>> getItensPorCodigoMesa(int mesaCodigo) async {
    try {
      final modelIn = await _dataSource.getItensPorCodigoMesa(mesaCodigo);
      return modelIn.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }

  @override
  Future<List<ItemPedidoEntity>> getItensPorCodigoConta(int contaId) async {
    try {
      final modelIn = await _dataSource.getItensPorCodigoConta(contaId);
      return modelIn.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}
