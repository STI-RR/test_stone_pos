import 'package:easyfood_app/features/common/domain/entities/mesa_fisica_entity.dart';

abstract interface class IMesaFisicaRepository {
  Future<List<MesaFisicaEntity>> getMesasFisicas();
}
