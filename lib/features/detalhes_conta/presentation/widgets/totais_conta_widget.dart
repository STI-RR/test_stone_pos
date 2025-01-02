import 'package:easyfood_app/core/util/number_util.dart';
import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/dialogs/dialog_alterar_valor_pagamento.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/dialogs/dialog_creditos_conta.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/widgets/totais/subtotal_widget.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/widgets/totais/total_couvert_widget.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/widgets/totais/total_gorjeta_widget.dart';
import 'package:easyfood_app/features/realizar_pagamento/presentation/states/pagamento_conta_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TotaisContaWidget extends StatelessWidget {
  final ContaEntity conta;

  const TotaisContaWidget(this.conta, {super.key});

  @override
  Widget build(BuildContext context) {
    final pagamentoState = context.read<PagamentoContaState?>();

    return Card(
      child: Column(
        children: [
          SubtotalWidget(conta),
          TotalCouvertWidget(conta),
          TotalGorjetaWidget(conta),
          _RowValorPago('Adiantamento', conta),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Total',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Visibility(
                  visible: pagamentoState?.canEditTotal ?? false,
                  child: IconButton(
                      onPressed: () async {
                        final pagamentoState = context.read<PagamentoContaState?>();
                        final value = await showDialog<double>(
                          context: context,
                          builder: (_) => DialogAlterarValorPagamento(initValue: conta.totalCalculado),
                        );
                        if (value != null) {
                          pagamentoState?.totalAPagar = value;
                        }
                      },
                      icon: const Icon(Icons.edit)),
                ),
                Text(
                  NumberUtil.formatCurrency(context.watch<PagamentoContaState?>()?.totalAPagar ?? conta.totalCalculado),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RowValorPago extends StatelessWidget {
  final String titulo;
  final double? valor;
  final ContaEntity conta;
  final TextStyle _style = TextStyle(color: Colors.green.shade700);

  _RowValorPago(this.titulo, this.conta) : valor = conta.adiantamento;

  @override
  Widget build(BuildContext context) {
    return valor == null || valor == 0
        ? const SizedBox()
        : InkWell(
            onTap: () => showDialog(context: context, builder: (_) => DialogCreditosConta(conta)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(titulo, style: _style),
                  const SizedBox(width: 4),
                  Icon(Icons.more, color: Colors.grey.shade400),
                  const Spacer(),
                  Text(NumberUtil.formatCurrency(valor!), style: _style),
                ],
              ),
            ),
          );
  }
}
