import 'package:easyfood_app/features/common/data/datasources/dio_datasource.dart';
import 'package:easyfood_app/features/detalhes_conta/data/datasources/cancelamento_datasource.dart';

class CancelamentoDataSourceImpl extends DioDataSource implements CancelamentoDataSource {
  CancelamentoDataSourceImpl(super.dio);

  @override
  Future<void> cancelarItem({
    required int idItem,
    required int idFuncionario,
    required String observacao,
  }) {
    return post('/itempedido/cancelar', queryParameters: {
      'item': idItem,
      'func': idFuncionario,
      'observacao': observacao,
    });
  }
}
