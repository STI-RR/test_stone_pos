import 'package:easyfood_app/features/configuracoes/data/models/configuracao_model_in.dart';

abstract interface class ConfiguracaoDataSource {
  Future<ConfiguracaoModelIn> getConfiguracao();
}
