import 'package:easyfood_app/features/common/data/datasources/dio_datasource.dart';
import 'package:easyfood_app/features/configuracoes/data/datasources/configuracao_datasource.dart';
import 'package:easyfood_app/features/configuracoes/data/models/configuracao_model_in.dart';

class ConfiguracaoRemoteDataSource extends DioDataSource implements ConfiguracaoDataSource {
  ConfiguracaoRemoteDataSource(super.dio);

  @override
  Future<ConfiguracaoModelIn> getConfiguracao() {
    return get('/configuracoes').then((value) => ConfiguracaoModelIn.fromJson(value));
  }
}
