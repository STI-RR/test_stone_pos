import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/features/common/data/converters/cobranca_pix_converter.dart';
import 'package:easyfood_app/features/common/data/datasources/cobranca_pix_datasource.dart';
import 'package:easyfood_app/features/common/domain/entities/cobranca_pix_entity.dart';
import 'package:easyfood_app/features/common/domain/repositories/i_cobranca_pix_repository.dart';

class CobrancaPixRepositoryImpl implements ICobrancaPixRepository {
  final CobrancaPixDataSource _dataSource;

  CobrancaPixRepositoryImpl(this._dataSource);

  @override
  Future<CobrancaPixEntity?> gerarCobrancaPix({required int idConta, double? valor}) async {
    try {
      final modelIn = await _dataSource.gerarCobrancaPix(idConta: idConta, valor: valor);
      if (modelIn != null) {
        return CobrancaPixConverter().convert(modelIn);
      }
      return null;
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}
