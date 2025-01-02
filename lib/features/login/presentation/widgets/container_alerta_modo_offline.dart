import 'package:easyfood_app/features/configuracoes/screens/configuracoes_screen.dart';
import 'package:flutter/material.dart';

class ContainerAlertaModoOffline extends StatefulWidget {
  const ContainerAlertaModoOffline({super.key});

  @override
  State<ContainerAlertaModoOffline> createState() => _ContainerAlertaModoOfflineState();
}

class _ContainerAlertaModoOfflineState extends State<ContainerAlertaModoOffline> {
  @override
  Widget build(BuildContext context) {
    final infoTextStyle = Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black87);

    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.yellow[700],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.warning, color: Colors.black),
              SizedBox(width: 8),
              Text('Modo offline', style: TextStyle(color: Colors.black)),
            ],
          ),
          RichText(
            text: TextSpan(
              text:
                  'Você está no modo offline. Alguns recursos podem não estar disponíveis. Para acessar todos os recursos, ',
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () => _openConfiguracoes(context),
                    child: Text(
                      'modifique a opção em configurações.',
                      style: infoTextStyle?.copyWith(color: Colors.blue),
                    ),
                  ),
                ),
              ],
              style: infoTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  void _openConfiguracoes(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ConfiguracoesScreen()));
  }
}
