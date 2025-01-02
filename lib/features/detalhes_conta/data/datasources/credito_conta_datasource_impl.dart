import 'package:easyfood_app/features/common/data/datasources/dio_datasource.dart';
import 'package:easyfood_app/features/detalhes_conta/data/datasources/credito_conta_datasource.dart';
import 'package:easyfood_app/features/detalhes_conta/data/models/credito_conta_model_in.dart';

class CreditoContaDataSourceImpl extends DioDataSource implements CreditoContaDataSource {
  CreditoContaDataSourceImpl(super.dio);

  @override
  Future<List<CreditoContaModelIn>> getCreditosConta(int idConta) {
    return getAsList('/credito/conta/$idConta')
        .then((value) => value.map((e) => CreditoContaModelIn.fromJson(e)).toList());
  }
}
