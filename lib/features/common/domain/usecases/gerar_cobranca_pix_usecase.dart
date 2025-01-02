import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/common/domain/entities/cobranca_pix_entity.dart';
import 'package:easyfood_app/features/common/domain/repositories/i_cobranca_pix_repository.dart';

class GerarCobrancaPixUseCase implements UseCase<CobrancaPixEntity, GerarCobrancaPixParams> {
  final ICobrancaPixRepository repository;

  GerarCobrancaPixUseCase(this.repository);

  @override
  Future<Result<CobrancaPixEntity>> call(GerarCobrancaPixParams params) async {
    try {
      final cobrancaPix = await repository.gerarCobrancaPix(idConta: params.idConta, valor: params.valor);
      if (cobrancaPix != null) {
        return Result.success(cobrancaPix);
      } else {
        return Result.failure('Erro ao gerar cobrança PIX');
      }
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class GerarCobrancaPixParams {
  final int idConta;
  final double? valor;

  GerarCobrancaPixParams({
    required this.idConta,
    this.valor,
  });
}
