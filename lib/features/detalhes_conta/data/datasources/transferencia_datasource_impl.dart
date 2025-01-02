import 'package:easyfood_app/features/common/data/datasources/dio_datasource.dart';
import 'package:easyfood_app/features/detalhes_conta/data/datasources/transferencia_datasource.dart';

class TransferenciaDataSourceImpl extends DioDataSource implements TransferenciaDataSource {
  TransferenciaDataSourceImpl(super.dio);

  @override
  Future<void> transferirMesa({
    required int idMesaOrigem,
    required int idMesaDestino,
    required int idFuncionario,
  }) {
    return post(
      '/conta/transferir',
      queryParameters: {
        'mesaOrigem': idMesaOrigem,
        'mesaDestino': idMesaDestino,
        'func': idFuncionario,
      },
    );
  }

  @override
  Future<void> transferirComanda({
    required int idComandaOrigem,
    required int idComandaDestino,
    required int idFuncionario,
  }) {
    return post(
      '/conta/transferircartao',
      queryParameters: {
        'cartaoOrigem': idComandaOrigem,
        'cartaoDestino': idComandaDestino,
        'func': idFuncionario,
      },
    );
  }

  @override
  Future<void> transferirItemComanda({
    required int idComandaOrigem,
    required int idComandaDestino,
    required int idItem,
    required int idFuncionario,
  }) {
    return post(
      '/conta/transferiritemcartao',
      queryParameters: {
        'cartaoOrigem': idComandaOrigem,
        'cartaoDestino': idComandaDestino,
        'item': idItem,
        'func': idFuncionario,
      },
    );
  }

  @override
  Future<void> transferirItemMesa({
    required int idMesaOrigem,
    required int idMesaDestino,
    required int idItem,
    required int idFuncionario,
  }) {
    return post(
      '/conta/transferiritem',
      queryParameters: {
        'mesaOrigem': idMesaOrigem,
        'mesaDestino': idMesaDestino,
        'item': idItem,
        'func': idFuncionario,
      },
    );
  }
}
