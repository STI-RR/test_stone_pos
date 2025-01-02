import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/features/configuracoes/data/converters/configuracao_converter.dart';
import 'package:easyfood_app/features/configuracoes/data/datasources/configuracao_local_datasource.dart';
import 'package:easyfood_app/features/configuracoes/data/datasources/configuracao_remote_datasource.dart';
import 'package:easyfood_app/features/configuracoes/domain/entities/configuracao_entity.dart';
import 'package:easyfood_app/features/configuracoes/domain/repositories/i_configuracao_repository.dart';

class ConfiguracaoRepositoryImpl implements IConfiguracaoRepository {
  ConfiguracaoRepositoryImpl(this._localDataSource, this._remoteDataSource);

  final ConfiguracaoLocalDataSource _localDataSource;
  final ConfiguracaoRemoteDataSource _remoteDataSource;

  @override
  Future<ConfiguracaoEntity> getConfiguracao() async {
    try {
      final modelIn = await _remoteDataSource.getConfiguracao();

      await _localDataSource.saveConfiguracao(modelIn);

      return ConfiguracaoConverter().convert(modelIn);
    } catch (e) {
      return _getLocalConfiguracao();
    }
  }

  Future<ConfiguracaoEntity> _getLocalConfiguracao() async {
    try {
      final modelIn = await _localDataSource.getConfiguracao();
      return ConfiguracaoConverter().convert(modelIn);
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}
