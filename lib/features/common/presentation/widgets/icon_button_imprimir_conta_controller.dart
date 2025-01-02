import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/detalhes_conta/model/usecases/imprimir_conta_pos_usecase.dart';

class IconButtonImprimirContaController {
  final ContaEntity conta;

  IconButtonImprimirContaController(this.conta);

  bool get isPosPrint => true;

  Future<Result> fecharConta({
    required int quantidadeDePessoas,
    required int funcionarioId,
    int? idCategoriaImpressaoConta,
  }) async {
    return Result.success('');
  }

  Future<Result> imprimirPrevia({
    required int funcionarioId,
    required int quantidadeDePessoas,
    required String nomeFuncionario,
  }) async {
    return await _imprimirPreviaTerminalPos(
      funcionarioId: funcionarioId,
      quantidadeDePessoas: quantidadeDePessoas,
      nomeFuncionario: nomeFuncionario,
    );
  }

  Future<Result> _imprimirPreviaTerminalPos({
    required int funcionarioId,
    required int quantidadeDePessoas,
    required String nomeFuncionario,
  }) async {
    String? qrCodePixImageBase64;

    final params = ImprimirContaPosParams(
      nomeEstabelecimento: 'TESTE',
      tituloLabelServico: 'Gorjeta',
      conta: conta,
      nomeFuncionario: nomeFuncionario,
      quantidadePessoas: quantidadeDePessoas,
      qrCodePixImageBase64: qrCodePixImageBase64,
    );
    final useCase = ImprimirContaPosUseCase();
    return await useCase(params);
  }
}
