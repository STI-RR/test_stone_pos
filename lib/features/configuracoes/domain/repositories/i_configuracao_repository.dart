import 'package:easyfood_app/features/configuracoes/domain/entities/configuracao_entity.dart';

abstract interface class IConfiguracaoRepository {
  Future<ConfiguracaoEntity> getConfiguracao();
}
