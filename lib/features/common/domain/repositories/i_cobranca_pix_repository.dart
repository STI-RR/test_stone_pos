import 'package:easyfood_app/features/common/domain/entities/cobranca_pix_entity.dart';

abstract interface class ICobrancaPixRepository {
  Future<CobrancaPixEntity?> gerarCobrancaPix({required int idConta, double? valor});
}
