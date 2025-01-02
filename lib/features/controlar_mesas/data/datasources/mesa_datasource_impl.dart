import 'package:easyfood_app/features/common/data/datasources/dio_datasource.dart';
import 'package:easyfood_app/features/controlar_mesas/data/datasources/mesa_datasource.dart';
import 'package:easyfood_app/features/controlar_mesas/data/models/mesa_model_in.dart';

class MesaDataSourceImpl extends DioDataSource implements MesaDataSource {
  MesaDataSourceImpl(super._dio);

  @override
  Future<List<MesaModelIn>> getMesas() async {
    var response = await getAsList('/mesas');
    return response.map((e) => MesaModelIn.fromJson(e)).toList();
  }

  @override
  Future<MesaModelIn> getMesa(int id) async {
    var response = await get('/mesas/$id');
    return MesaModelIn.fromJson(response);
  }
}
