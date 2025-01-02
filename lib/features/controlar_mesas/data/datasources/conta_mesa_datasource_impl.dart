import 'package:easyfood_app/features/common/data/datasources/dio_datasource.dart';
import 'package:easyfood_app/features/controlar_mesas/data/datasources/conta_mesa_datasource.dart';
import 'package:easyfood_app/features/controlar_mesas/data/models/conta_mesa_model_in.dart';

class ContaMesaDataSourceImpl extends DioDataSource implements ContaMesaDataSource {
  ContaMesaDataSourceImpl(super._dio);

  @override
  Future<ContaMesaModelIn?> findByMesaCodigo(int mesaCodigo) async {
    var response = await get('/conta?mesa=$mesaCodigo');
    if (response == null) return null;
    return ContaMesaModelIn.fromJson(response);
  }
}
