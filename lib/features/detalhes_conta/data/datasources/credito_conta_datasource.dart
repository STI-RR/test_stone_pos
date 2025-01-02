import 'package:easyfood_app/features/detalhes_conta/data/models/credito_conta_model_in.dart';

abstract interface class CreditoContaDataSource {
  Future<List<CreditoContaModelIn>> getCreditosConta(int idConta);
}
