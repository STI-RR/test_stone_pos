import 'package:easyfood_app/core/util/number_util.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DialogQrCodePixEstatico extends StatelessWidget {
  final String payload;
  final double? amount;
  final verdePix = const Color(0xFF77B6A8); // Manual de uso da marca v1.3 de 17 de setembro de 2021

  const DialogQrCodePixEstatico({
    super.key,
    required this.payload,
    this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(Icons.pix, color: verdePix, size: 48),
      content: _QrCode(data: payload, amount: amount),
    );
  }
}

class _QrCode extends StatelessWidget {
  final String data;
  final double? amount;

  const _QrCode({
    required this.data,
    this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: QrImageView(data: data),
        ),
        const SizedBox(height: 16),
        if (amount != null)
          Text(
            NumberUtil.formatCurrency(amount!),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        const _ContainerAvisoNaoCompensacaoAutomatica(),
      ],
    );
  }
}

class _ContainerAvisoNaoCompensacaoAutomatica extends StatelessWidget {
  const _ContainerAvisoNaoCompensacaoAutomatica();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Icon(Icons.info, color: Colors.amber),
          const SizedBox(height: 8),
          Text(
            'Pagador: Não realize o pagamento se o valor não corresponder ao valor da compra.\n\n'
            'Recebedor: Confira com o banco a efetivação do pagamento.',
            style: TextStyle(color: Colors.amber[900]),
          ),
        ],
      ),
    );
  }
}
