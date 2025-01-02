import 'package:easyfood_app/features/controlar_mesas/presentation/states/mesas_state.dart';
import 'package:easyfood_app/features/controlar_mesas/presentation/widgets/mesas_filter_popupmenu_widget.dart';
import 'package:easyfood_app/features/controlar_mesas/presentation/widgets/mesas_grid_widget.dart';
import 'package:easyfood_app/features/controlar_mesas/presentation/widgets/search_mesa_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MesasPage extends StatelessWidget {
  const MesasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MesasState>(create: (_) => MesasState()..init()),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Mesas'),
            actions: const [
              MesasFilterPopupMenuWidget(),
              SearchMesaWidget(),
            ],
          ),
          body: const MesasGridWidget(),
        ),
      ),
    );
  }
}
