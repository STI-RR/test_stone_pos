import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/common/domain/repositories/i_item_pedido_repository.dart';
import 'package:easyfood_app/features/common/presentation/dialog/dialog_inserir_numero_widget.dart';
import 'package:easyfood_app/features/common/presentation/widgets/snack_bar_widget.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/mesa_entity.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/status_mesa.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/repositories/i_conta_mesa_repository.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/usecases/get_conta_mesa_com_itens_por_mesa_usecase.dart';
import 'package:easyfood_app/features/controlar_mesas/presentation/states/mesas_state.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/pages/detalhes_conta_page.dart';
import 'package:easyfood_app/features/realizar_pedido/presentation/pages/pedido_page.dart';
import 'package:easyfood_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchMesaWidget extends StatelessWidget {
  const SearchMesaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (_) => DialogInserirNumeroWidget(
            'Buscar mesa',
            onConfirm: (choice) {
              try {
                final mesa = context.read<MesasState>().mesas.firstWhere((mesa) => mesa.codigo == choice);
                _handleTap(context, mesa);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBarWidget.error(context, 'Mesa não cadastrada!'),
                );
              }
            },
          ),
        );
      },
      icon: const Icon(Icons.search),
    );
  }

  void _handleTap(BuildContext context, MesaEntity mesa) async {
    final navigator = Navigator.of(context);
    if (mesa.status == StatusMesa.livre) {
      navigator.push(MaterialPageRoute(builder: (_) => PedidoPage(mesa: mesa)));
      return;
    }

    _showLoadContaDialog(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final conta = await _loadConta(mesa);
    navigator.pop(); // Pop the dialog

    if (conta != null) {
      navigator.push(MaterialPageRoute(builder: (_) => DetalhesContaPage(conta)));
    } else {
      scaffoldMessenger.showSnackBar(
        SnackBarWidget.error(context, 'Não foi possível carregar a conta da mesa ${mesa.codigo}'),
      );
    }
  }

  void _showLoadContaDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        // dialog with a progress indicator
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text('Carregando conta...'),
            ],
          ),
        );
      },
    );
  }

  Future<ContaMesaEntity?> _loadConta(MesaEntity mesa) async {
    final contaMesaRepository = getIt<IContaMesaRepository>();
    final itemPedidoRepository = getIt<IItemPedidoRepository>();
    final useCase = GetContaMesaComItensPorMesaUseCase(contaMesaRepository, itemPedidoRepository);
    final params = GetContaMesaComItensPorMesaUseCaseParams(mesaId: mesa.codigo);
    final result = await useCase.call(params);

    if (result.isSuccess) {
      return result.asSuccess!.value;
    }
    return null;
  }
}
