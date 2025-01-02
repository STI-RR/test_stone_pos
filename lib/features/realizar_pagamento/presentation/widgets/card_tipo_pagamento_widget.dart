import 'package:easyfood_app/features/realizar_pagamento/presentation/pages/transacao_page.dart';
import 'package:easyfood_app/features/realizar_pagamento/presentation/pages/transacao_page_params.dart';
import 'package:easyfood_app/features/realizar_pagamento/presentation/states/pagamento_conta_state.dart';
import 'package:easyfood_app/features/transacoes/domain/entities/status_tipo_pagamento_transacao_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardTipoPagamentoWidget extends StatelessWidget {
  final IconData iconData;
  final String titulo;
  final Color? color;

  const CardTipoPagamentoWidget(
    this.iconData,
    this.titulo, {
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.read<PagamentoContaState>().isVisible(key),
      child: InkWell(
        onTap: () => _onTap(context),
        child: Card(
          elevation: context.watch<PagamentoContaState>().selected == key ? 12 : null,
          margin:
              context.watch<PagamentoContaState>().selected == key ? const EdgeInsets.symmetric(vertical: 16) : null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(iconData, size: 40, color: color),
                const SizedBox(width: 8),
                Text(
                  titulo,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) async {
    final state = context.read<PagamentoContaState>();

    StatusTipoPagamentoTransacaoEntity formaDePagamento = _getFormaDePagamento(state);

    final double totalDecimal = state.totalAPagar;
    final String totalCentavosString = totalDecimal.toStringAsFixed(2).replaceAll('.', '');
    final int valorEmCentavos = int.parse(totalCentavosString);

    final transactionParameters = TransacaoPageParams(
      valorEmCentavos: valorEmCentavos,
      formaDePagamento: formaDePagamento,
      codigoConta: state.conta.codigo,
      quantidadePessoas: state.conta.quantidadeDePessoas,
      valorCouvertEmCentavos: ((state.conta.couvert ?? 0) * 100).toInt(),
      removerGorjeta: state.removerGorjeta,
      usuarioRemocaoGorjeta: state.conta.usuarioRemocaoGorjeta,
      removerCouvert: state.removerCouvert,
      usuarioRemocaoCouvert: state.conta.usuarioRemocaoCouvert,
    );

    final navigator = Navigator.of(context);
    final success = await navigator.push<bool>(
      MaterialPageRoute(builder: (context) => TransacaoPage(params: transactionParameters)),
    );
    if (success != null && success) {
      navigator.pop(success);
    }
  }

  StatusTipoPagamentoTransacaoEntity _getFormaDePagamento(PagamentoContaState state) {
    state.selected = key;
    StatusTipoPagamentoTransacaoEntity formaDePagamento;
    const flavor = 'stone';
    if (state.keyCredito == key) {
      formaDePagamento = StatusTipoPagamentoTransacaoEntity.fromString('${flavor}_credito');
    } else if (state.keyDebito == key) {
      formaDePagamento = StatusTipoPagamentoTransacaoEntity.fromString('${flavor}_debito');
    } else if (state.keyPix == key) {
      formaDePagamento = StatusTipoPagamentoTransacaoEntity.fromString('${flavor}_pix');
    } else if (state.keyDinheiro == key) {
      formaDePagamento = StatusTipoPagamentoTransacaoEntity.easyFoodCash;
    } else {
      throw Exception('Forma de pagamento não encontrada');
    }
    return formaDePagamento;
  }
}
