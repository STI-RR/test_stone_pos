import 'package:easyfood_app/features/common/data/datasources/cobranca_pix_datasource.dart';
import 'package:easyfood_app/features/common/data/datasources/dio_datasource.dart';
import 'package:easyfood_app/features/common/data/models/cobranca_pix_model_in.dart';

class CobrancaPixDataSourceImpl extends DioDataSource implements CobrancaPixDataSource {
  CobrancaPixDataSourceImpl(super.dio);

  @override
  Future<CobrancaPixModelIn?> gerarCobrancaPix({required int idConta, double? valor}) {
    return get(
      '/cobrancapix',
      queryParameters: {
        'conta': idConta,
        if (valor != null) 'valor': valor,
      },
    ).then((value) => CobrancaPixModelIn.fromJson(value));
  }
}
