import 'package:easyfood_app/features/controlar_mesas/domain/entities/status_mesa.dart';
import 'package:easyfood_app/features/controlar_mesas/presentation/states/mesas_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MesasFilterPopupMenuWidget extends StatelessWidget {
  const MesasFilterPopupMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String?>(
      icon: const Icon(Icons.filter_alt_rounded),
      onSelected: (value) {
        if (value == 'Todas') {
          context.read<MesasState>().filter(null);
        } else if (value == 'Livres') {
          context.read<MesasState>().filter(StatusMesa.livre);
        } else if (value == 'Ocupadas') {
          context.read<MesasState>().filter(StatusMesa.ocupada);
        } else if (value == 'Fechadas') {
          context.read<MesasState>().filter(StatusMesa.fechamento);
        }
      },
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: 'Todas',
            child: Text('Todas'),
          ),
          const PopupMenuItem(
            value: 'Livres',
            child: Text('Livres'),
          ),
          const PopupMenuItem(
            value: 'Ocupadas',
            child: Text('Ocupadas'),
          ),
          const PopupMenuItem(
            value: 'Fechadas',
            child: Text('Fechadas'),
          ),
        ];
      },
    );
  }
}
