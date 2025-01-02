import 'package:easyfood_app/core/util/date_util.dart';
import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/common/presentation/widgets/icon_button_imprimir_conta_widget.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/dialogs/dialog_detalhes_conta.dart';
import 'package:flutter/material.dart';

class HeaderContaWidget extends StatelessWidget {
  final ContaEntity conta;

  const HeaderContaWidget(
    this.conta, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      // Material here to prevent InkWell from throwing error when hero effect is used
      child: InkWell(
        onTap: () => showDialog(context: context, builder: (_) => DialogDetalhesConta(conta)),
        child: Container(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          padding: conta.tipo != TipoConta.ficha
              ? const EdgeInsets.only(left: 8, top: 8, bottom: 8)
              : const EdgeInsets.all(8),
          child: Row(
            children: [
              Text(
                conta.descricao(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(width: 4),
              const Icon(Icons.info, color: Colors.grey),
              const Spacer(),
              Text(
                DateUtil.getFormattedDateTimeWithMonthAbbreviated(conta.dataHoraAbertura),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Visibility(
                visible: conta.tipo != TipoConta.ficha,
                child: IconButtonImprimirContaWidget(conta),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
