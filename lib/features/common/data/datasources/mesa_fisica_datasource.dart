import 'package:easyfood_app/features/common/data/models/mesa_fisica_model_in.dart';

abstract interface class MesaFisicaDataSource {
  Future<List<MesaFisicaModelIn>> getMesasFisicas();
}
