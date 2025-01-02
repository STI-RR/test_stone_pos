import 'package:easyfood_app/features/controlar_mesas/data/models/mesa_model_in.dart';

abstract interface class MesaDataSource {
  Future<List<MesaModelIn>> getMesas();
  Future<MesaModelIn> getMesa(int id);
}
