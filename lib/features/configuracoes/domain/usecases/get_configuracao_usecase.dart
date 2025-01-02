import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/configuracoes/domain/entities/configuracao_entity.dart';
import 'package:easyfood_app/features/configuracoes/domain/entities/configuracao_pos_entity.dart';

class GetConfiguracaoUseCase implements UseCase<ConfiguracaoEntity, NoParams> {
  GetConfiguracaoUseCase();

  @override
  Future<Result<ConfiguracaoEntity>> call(NoParams params) async {
    try {
      final configuracao = ConfiguracaoEntity(
          tipoPrecoPizza: TipoPrecoPizza.mediaAritmetica,
          nomeEstabelecimento: 'TESTE',
          configuracaoPos: ConfiguracaoPosEntity(
              permitirPagamentoEmDinheiroParaTodos: true,
              permitirPagamentoParcialPos: true,
              permitirRemoverTaxaDeServico: true,
              permitirRemoverCouvert: true,
              habilitarPosDinheiro: true,
              habilitarPosDebito: true,
              habilitarPosCredito: true,
              habilitarPosPix: true,
              habilitarPedidoFichaPos: true,
              especificarBandeiraPos: true,
              impressaoPosPedidoFicha: ImpressaoPedidoFichaPos.imprimir,
              impressaoPosContaFicha: true,
              descricaoComanda: 'COMANDA',
              imprimirViaEstabelecimento: true),
          textoParaGorjeta: 'GORJETA',
          solicitarNumeroDePessoasComanda: true,
          habilitarPedidoMesa: true,
          habilitarPedidoComanda: true,
          habilitarPedidoPraViagem: true,
          habilitarPedidoDelivery: true,
          agruparQuantidadeItensPedido: true,
          habilitarPixDinamico: true,
          habilitarPixEstatico: true,
          mesaFisicaNoPedido: true,
          mesaFisicaNoPedidoMesa: true,
          mesaFisicaNoPedidoComanda: true,
          mesaFisicaNoPedidoFicha: true,
          mesaFisicaNaConta: true,
          mesaFisicaNaContaMesa: true,
          mesaFisicaNaContaComanda: true,
          habilitarCardapioPizzas: true,
          habilitarCardapioCombos: true,
          permiteImpressaoItemPedidoEmEspera: true,
          validarMesaFisica: true,
          escolherCategoriaImpressaoConta: true,
          valorPercentualTaxaServico: 10,
          valorCouvert: 5,
          cobrarCouvertFicha: true,
          cobrarServicoFicha: true);
      return Result.success(configuracao);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
