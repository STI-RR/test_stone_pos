import 'package:easyfood_app/features/controlar_mesas/data/models/conta_mesa_model_in.dart';

abstract interface class ContaMesaDataSource {
  Future<ContaMesaModelIn?> findByMesaCodigo(int mesaCodigo);
}
