import 'package:easyfood_app/features/common/data/models/cobranca_pix_model_in.dart';

abstract interface class CobrancaPixDataSource {
  Future<CobrancaPixModelIn?> gerarCobrancaPix({required int idConta, double? valor});
}
