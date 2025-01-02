import 'package:easyfood_app/core/exception/datasource_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesDataSource {
  SharedPreferences? _sharedPreferences;
  final String _dataSourceKey;
  String get key => _dataSourceKey;
  static final Set<String> _keys = {};

  SharedPreferencesDataSource(this._dataSourceKey) {
    SharedPreferences.getInstance().then((value) => _sharedPreferences = value);
    if (_keys.contains(_dataSourceKey)) {
      throw LocalDataSourceException('Chave $_dataSourceKey já está sendo utilizada');
    }
  }

  String? get(String valueKey) {
    if (_sharedPreferences == null) {
      throw LocalDataSourceException('SharedPreferences não inicializado');
    }
    return _sharedPreferences!.getString('${_dataSourceKey}_$valueKey');
  }

  Future<bool> save(String valueKey, String value) {
    if (_sharedPreferences == null) {
      throw LocalDataSourceException('SharedPreferences não inicializado');
    }
    return _sharedPreferences!.setString('${_dataSourceKey}_$valueKey', value);
  }

  Future<void> clearAll() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final keys = sharedPreferences.getKeys();

    for (final key in keys) {
      if (key.startsWith(_dataSourceKey)) {
        await sharedPreferences.remove(key);
      }
    }
  }
}
