import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/widgets/header_conta_widget.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/widgets/list_tipo_pagamento_widget.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/widgets/totais_conta_widget.dart';
import 'package:easyfood_app/features/realizar_pagamento/presentation/states/pagamento_conta_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PagamentoContaScreen extends StatelessWidget {
  final ContaEntity conta;

  const PagamentoContaScreen(this.conta, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PagamentoContaState(conta),
      builder: (context, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Pagamento'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: 'header_conta',
                  child: HeaderContaWidget(conta),
                ),
                Hero(
                  tag: 'totais_conta',
                  child: TotaisContaWidget(conta),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTipoPagamentoWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
