import 'package:easyfood_app/features/controlar_mesas/presentation/states/mesas_state.dart';
import 'package:easyfood_app/features/controlar_mesas/presentation/widgets/mesas_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MesasGridWidget extends StatelessWidget {
  const MesasGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _defineCrossAxisByWidth(context),
        childAspectRatio: 1.0,
      ),
      itemCount: context.watch<MesasState>().mesas.length,
      itemBuilder: (context, index) {
        final mesa = context.watch<MesasState>().mesas[index];
        return MesasTileWidget(mesa);
      },
    );
  }

  int _defineCrossAxisByWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 3;
    } else if (width < 900) {
      return 6;
    } else {
      return 9;
    }
  }
}
