import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DialogOpcoesImpressaoConta extends StatelessWidget {
  const DialogOpcoesImpressaoConta({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Row(
              children: [
                Expanded(child: Text('Escolha a opção', style: Theme.of(context).textTheme.headlineSmall)),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(FontAwesomeIcons.x),
                  iconSize: 12,
                  padding: EdgeInsets.zero,
                  alignment: Alignment.topRight,
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('previa');
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.print),
                  SizedBox(width: 8),
                  Text('Imprimir prévia'),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('conta');
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.payment),
                  SizedBox(width: 8),
                  Text('Fechar conta'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
