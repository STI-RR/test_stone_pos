import 'package:easyfood_app/features/common/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';

class DialogJuntarMesa extends StatelessWidget {
  final String message;
  final int mesaOrigem;
  final int mesaDestino;
  const DialogJuntarMesa(
    this.message, {
    super.key,
    required this.mesaOrigem,
    required this.mesaDestino,
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
          Text('Deseja juntar as mesas $mesaOrigem com $mesaDestino ?'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Não'),
        ),
        TextButton(
          onPressed: () => _juntarMesas(context),
          child: const Text('Sim'),
        ),
      ],
    );
  }

  void _juntarMesas(BuildContext context) async {
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    navigator.pop(); // Pop one mode to close page
    scaffoldMessenger.showSnackBar(
      SnackBarWidget.success(context, 'Mesa juntada com sucesso'),
    );
  }
}
