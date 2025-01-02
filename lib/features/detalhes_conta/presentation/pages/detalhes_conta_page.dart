import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/common/presentation/dialog/dialog_inserir_numero_widget.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/states/detalhes_conta_state.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/widgets/button_pagar_conta_widget.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/widgets/header_conta_widget.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/widgets/itens_conta_datatable_widget.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/widgets/totais_conta_widget.dart';
import 'package:easyfood_app/features/realizar_pagamento/presentation/pages/pagamento_conta_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalhesContaPage extends StatelessWidget {
  final ContaEntity conta;

  const DetalhesContaPage(this.conta, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DetalhesContaState>(
          create: (_) => DetalhesContaState(conta),
        ),
      ],
      builder: (context, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('Detalhes da conta')),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Hero(
                  tag: 'header_conta',
                  child: HeaderContaWidget(conta),
                ),
                _Body(conta: conta),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final ContaEntity conta;

  const _Body({required this.conta});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 900
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _BlocoItens(conta: conta),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: _BlocoPagamento(conta: conta),
              ),
            ],
          )
        : Column(
            children: [
              _BlocoItens(conta: conta),
              _BlocoPagamento(conta: conta),
            ],
          );
  }
}

class _BlocoItens extends StatelessWidget {
  final ContaEntity conta;

  const _BlocoItens({
    required this.conta,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Align(
                alignment: Alignment.topLeft,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.minWidth),
                  child: const ItensContaDataTableWidget(),
                ),
              ),
            ),
            Visibility(
              visible: conta.podeAdicionarItem,
              child: TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text('Adicionar item'),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class _BlocoPagamento extends StatelessWidget {
  final ContaEntity conta;

  const _BlocoPagamento({
    required this.conta,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 'totais_conta',
          child: TotaisContaWidget(conta),
        ),
        Hero(
          tag: 'button_pagar_conta',
          child: ButtonPagarContaWidget(
            onPressed: () => _pagar(context),
          ),
        ),
      ],
    );
  }

  void _pagar(BuildContext context) async {
    await _atualizaValorCouvertPorPessoa(context);
    if (!context.mounted) {
      return;
    }

    final navigator = Navigator.of(context);
    final success = await navigator.push(
      MaterialPageRoute(builder: (context) => PagamentoContaScreen(conta)),
    );
    if (success == true) {
      navigator.pop(true);
    }
  }

  /// Método duplicado em tab_finalizados_body_widget.dart
  Future<void> _atualizaValorCouvertPorPessoa(BuildContext context) async {
    if (conta.couvert == null || conta.couvert == 0) {
      return;
    }

    bool couvertPorPessoa = false;
    if (conta is ContaMesaEntity) {
      couvertPorPessoa = (conta as ContaMesaEntity).couvertPorPessoa;
    } else if (conta is ContaComandaEntity) {
      couvertPorPessoa = (conta as ContaComandaEntity).couvertPorPessoa;
    }

    if (!couvertPorPessoa) {
      return;
    }

    final quantidadeDePessoas = await showDialog<int>(
      context: context,
      builder: (_) => DialogInserirNumeroWidget(
        'Quantidade de pessoas',
        initialValue: conta.quantidadeDePessoas.toString(),
      ),
    );

    if (quantidadeDePessoas != null) {
      conta.quantidadeDePessoas = quantidadeDePessoas;
    } else {
      throw Exception('Quantidade de pessoas não informada');
    }
  }
}
