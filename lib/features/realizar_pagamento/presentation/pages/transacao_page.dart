import 'dart:async';
import 'dart:convert';

import 'package:easyfood_app/core/util/number_util.dart';
import 'package:easyfood_app/features/common/presentation/states/auth_state.dart';
import 'package:easyfood_app/features/realizar_pagamento/presentation/pages/transacao_page_params.dart';
import 'package:easyfood_app/features/realizar_pagamento/presentation/states/transacao_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransacaoPage extends StatelessWidget {
  final TransacaoPageParams params;

  const TransacaoPage({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransacaoState(params, context.read<AuthState>().usuario!),
      builder: (context, child) {
        final reactiveState = context.watch<TransacaoState>();
        return PopScope(
          canPop: false,
          child: SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 120,
                      child: Card(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Valor', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text(
                                  params.formaDePagamento.description,
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              NumberUtil.formatCurrency(params.valorEmCentavos / 100),
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    reactiveState.mainText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: reactiveState.isPaymentComplete
                              ? (reactiveState.isPaymentSuccess ? Colors.green : Colors.red)
                              : null,
                        ),
                  ),
                  reactiveState.secondaryText.isEmpty
                      ? const SizedBox.shrink()
                      : Text(
                          reactiveState.secondaryText,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                  const _QrCodePix(),
                  const Spacer(),
                  Visibility(
                    visible: reactiveState.showButtonPrintTransactionReceipt,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () => context.read<TransacaoState>().printTransactionReceipt(),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.receipt_long, size: 24),
                            const SizedBox(width: 8),
                            Text(
                              'Imprimir comprovante',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: reactiveState.isPaymentComplete,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(context.read<TransacaoState>().isPaymentSuccess),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                        ),
                        child: Text(
                          'Concluir',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                      ),
                    ),
                  ),
                  const _ButtonCancelar(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _QrCodePix extends StatelessWidget {
  const _QrCodePix();

  @override
  Widget build(BuildContext context) {
    final reactiveState = context.watch<TransacaoState>();
    return Visibility(
      visible: reactiveState.qrCodePix != null && !reactiveState.isPaymentComplete,
      child: reactiveState.qrCodePix == null
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Image.memory(
                    base64Decode(reactiveState.qrCodePix!),
                    width: 200,
                    height: 200,
                  ),
                  LinearTimer(
                    durationMilliseconds: 90 * 1000, // 90 seconds
                    onTimerFinish: () {
                      context.read<TransacaoState>().cancelPayment();
                    },
                  ),
                ],
              ),
            ),
    );
  }
}

class LinearTimer extends StatefulWidget {
  final int durationMilliseconds;
  final Function onTimerFinish;
  final Duration updateInterval;

  const LinearTimer({
    super.key,
    required this.durationMilliseconds,
    required this.onTimerFinish,
    this.updateInterval = const Duration(seconds: 1),
  });

  @override
  LinearTimerState createState() => LinearTimerState();
}

class LinearTimerState extends State<LinearTimer> {
  late int _millisecondsRemaining;
  late double _barWidth;
  late Duration _updateInterval;

  @override
  void initState() {
    super.initState();
    _millisecondsRemaining = widget.durationMilliseconds;
    _barWidth = 1.0;
    _updateInterval = widget.updateInterval;
    startTimer();
  }

  void startTimer() {
    Timer.periodic(_updateInterval, (timer) {
      setState(() {
        if (_millisecondsRemaining > 0) {
          _millisecondsRemaining -= _updateInterval.inMilliseconds;
          _barWidth = _millisecondsRemaining <= 0 ? 0 : _millisecondsRemaining / widget.durationMilliseconds;
        } else {
          widget.onTimerFinish();
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 30.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.black,
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: _barWidth,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(
                    _millisecondsRemaining <= 0
                        ? "finalizado"
                        : ("${(_millisecondsRemaining / 1000).toStringAsFixed(0)}s restantes"),
                    style: TextStyle(
                      color: _millisecondsRemaining <= 0 ? Colors.white : Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                const Icon(
                  Icons.timer_sharp,
                  color: Colors.white,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _ButtonCancelar extends StatelessWidget {
  const _ButtonCancelar();

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !context.watch<TransacaoState>().isPaymentComplete,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: OutlinedButton(
          onPressed: () async {
            final navigator = Navigator.of(context);
            final transacaoState = context.read<TransacaoState>();
            final confirm = await _showConfirmDialog(context);
            if (confirm == true) {
              transacaoState.cancelPayment();
              navigator.pop(false);
            }
          },
          child: const Text('Cancelar'),
        ),
      ),
    );
  }

  Future<bool?> _showConfirmDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancelar pagamento'),
        content: const Text('Deseja realmente cancelar o pagamento?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Não'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Sim'),
          ),
        ],
      ),
    );
  }
}
