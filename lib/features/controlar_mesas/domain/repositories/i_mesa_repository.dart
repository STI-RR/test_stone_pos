import 'package:easyfood_app/features/controlar_mesas/domain/entities/mesa_entity.dart';

abstract interface class IMesaRepository {
  Future<MesaEntity> getMesa(int id);
  Future<List<MesaEntity>> getMesas();
}
