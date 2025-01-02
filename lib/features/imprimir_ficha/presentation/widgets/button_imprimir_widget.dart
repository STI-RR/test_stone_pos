import 'package:easyfood_app/features/imprimir_ficha/presentation/states/imprimir_ficha_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonImprimirWidget extends StatelessWidget {
  const ButtonImprimirWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ImprimirFichaState>();
    return ElevatedButton(
      onPressed: state.allPrinted
          ? Navigator.of(context).pop
          : state.noneSelected
              ? null
              : state.print,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        disabledBackgroundColor: Colors.grey,
      ),
      child: Text(state.allPrinted ? 'Concluir' : 'Imprimir'),
    );
  }
}
