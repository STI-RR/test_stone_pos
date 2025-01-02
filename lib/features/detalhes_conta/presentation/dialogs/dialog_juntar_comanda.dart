import 'package:easyfood_app/features/common/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';

class DialogJuntarComanda extends StatelessWidget {
  final String message;
  final int comandaOrigem;
  final int comandaDestino;
  const DialogJuntarComanda(
    this.message, {
    super.key,
    required this.comandaOrigem,
    required this.comandaDestino,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(Icons.warning, color: Theme.of(context).colorScheme.error),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          const SizedBox(height: 16),
          Text('Deseja juntar as comandas $comandaOrigem com $comandaDestino ?'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Não'),
        ),
        TextButton(
          onPressed: () => _juntarComandas(context),
          child: const Text('Sim'),
        ),
      ],
    );
  }

  void _juntarComandas(BuildContext context) async {
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    navigator.pop(); // Pop one mode to close page
    scaffoldMessenger.showSnackBar(
      SnackBarWidget.success(context, 'Comanda juntada com sucesso'),
    );
  }
}
