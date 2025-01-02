import 'package:easyfood_app/core/util/number_util.dart';
import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/states/dialog_creditos_conta_state.dart';
import 'package:easyfood_app/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogCreditosConta extends StatelessWidget {
  final ContaEntity conta;
  const DialogCreditosConta(this.conta, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Créditos'),
      content: ChangeNotifierProvider(
        create: (context) => DialogCreditosContaState(conta)..getCreditosConta(),
        builder: (context, child) {
          final state = context.watch<DialogCreditosContaState>();
          if (state.loadingState == LoadingState.loading) {
            return const SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            );
          } else if (state.loadingState == LoadingState.error) {
            return Center(child: Text(state.errorMessage));
          } else {
            return SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.creditos.length,
                itemBuilder: (context, index) {
                  final credito = state.creditos[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(credito.descricaoTipoPagamento),
                    subtitle: Text(credito.descricao.toLowerCase()),
                    trailing: Text(NumberUtil.formatCurrency(credito.valor)),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
