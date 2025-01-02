import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';

abstract interface class IContaMesaRepository {
  Future<ContaMesaEntity?> findByMesaCodigo(int mesaCodigo);
}
