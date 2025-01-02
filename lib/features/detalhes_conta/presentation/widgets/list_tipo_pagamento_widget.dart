import 'package:easyfood_app/features/realizar_pagamento/presentation/states/pagamento_conta_state.dart';
import 'package:easyfood_app/features/realizar_pagamento/presentation/widgets/card_tipo_pagamento_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ListTipoPagamentoWidget extends StatelessWidget {
  const ListTipoPagamentoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<PagamentoContaState>();
    return ListView(
      shrinkWrap: true,
      children: [
        CardTipoPagamentoWidget(
          key: state.keyCredito,
          Icons.credit_card,
          'Cartão de crédito',
        ),
        CardTipoPagamentoWidget(
          key: state.keyDebito,
          Icons.credit_card,
          'Cartão de débito',
        ),
        CardTipoPagamentoWidget(
          key: state.keyPix,
          FontAwesomeIcons.pix,
          'PIX',
          color: Colors.green,
        ),
        CardTipoPagamentoWidget(
          key: state.keyDinheiro,
          FontAwesomeIcons.brazilianRealSign,
          'Dinheiro',
          color: Colors.amber,
        ),
      ],
    );
  }
}
