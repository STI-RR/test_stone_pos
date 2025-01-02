import 'package:easyfood_app/features/detalhes_conta/model/entities/credito_entity.dart';

abstract interface class ICreditoRepository {
  Future<List<CreditoEntity>> getCreditosConta(int idConta);
}
