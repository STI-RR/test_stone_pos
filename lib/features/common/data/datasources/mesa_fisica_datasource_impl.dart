import 'package:easyfood_app/features/common/data/datasources/dio_datasource.dart';
import 'package:easyfood_app/features/common/data/datasources/mesa_fisica_datasource.dart';
import 'package:easyfood_app/features/common/data/models/mesa_fisica_model_in.dart';

class MesaFisicaDataSourceImpl extends DioDataSource implements MesaFisicaDataSource {
  MesaFisicaDataSourceImpl(super.dio);

  @override
  Future<List<MesaFisicaModelIn>> getMesasFisicas() {
    return get('/mesasfisicas')
        .then((value) => value.map<MesaFisicaModelIn>((e) => MesaFisicaModelIn.fromJson(e)).toList());
  }
}
