import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/imprimir_ficha/presentation/states/imprimir_ficha_state.dart';
import 'package:easyfood_app/features/imprimir_ficha/presentation/widgets/button_imprimir_widget.dart';
import 'package:easyfood_app/features/imprimir_ficha/presentation/widgets/item_ficha_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImprimirFichaPage extends StatelessWidget {
  final ContaEntity conta;

  const ImprimirFichaPage({super.key, required this.conta});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ImprimirFichaState(conta),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Imprimir fichas'),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: conta.itensPedido.length,
                  separatorBuilder: (context, index) => const Divider(color: Colors.black45),
                  itemBuilder: (context, index) {
                    return ItemFichaWidget(index: index);
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ButtonImprimirWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
