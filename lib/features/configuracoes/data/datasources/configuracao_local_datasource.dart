import 'dart:convert';

import 'package:easyfood_app/features/configuracoes/data/datasources/configuracao_datasource.dart';
import 'package:easyfood_app/features/configuracoes/data/models/configuracao_model_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracaoLocalDataSource implements ConfiguracaoDataSource {
  @override
  Future<ConfiguracaoModelIn> getConfiguracao() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final configuracoesJson = sharedPreferences.getString('configuracoes');
    if (configuracoesJson != null) {
      final jsonDecoded = jsonDecode(configuracoesJson);
      return ConfiguracaoModelIn.fromJson(jsonDecoded);
    } else {
      throw Exception('Configurações não encontradas');
    }
  }

  Future<void> saveConfiguracao(ConfiguracaoModelIn configuracao) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final jsonEncoded = jsonEncode(configuracao.toJson());
    await sharedPreferences.setString('configuracoes', jsonEncoded);
  }
}
