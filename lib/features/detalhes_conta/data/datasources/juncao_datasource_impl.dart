import 'package:easyfood_app/features/common/data/datasources/dio_datasource.dart';
import 'package:easyfood_app/features/detalhes_conta/data/datasources/juncao_datasource.dart';

class JuncaoDataSourceImpl extends DioDataSource implements JuncaoDataSource {
  JuncaoDataSourceImpl(super.dio);

  @override
  Future<void> juntarMesa({
    required int idMesaOrigem,
    required int idMesaDestino,
    required int idFuncionario,
  }) {
    return post(
      '/conta/juntar',
      queryParameters: {
        'mesaOrigem': idMesaOrigem,
        'mesaDestino': idMesaDestino,
        'func': idFuncionario,
      },
    );
  }

  @override
  Future<void> juntarComanda({
    required int idComandaOrigem,
    required int idComandaDestino,
    required int idFuncionario,
  }) {
    return post(
      '/conta/juntarcartao',
      queryParameters: {
        'cartaoOrigem': idComandaOrigem,
        'cartaoDestino': idComandaDestino,
        'func': idFuncionario,
      },
    );
  }
}
