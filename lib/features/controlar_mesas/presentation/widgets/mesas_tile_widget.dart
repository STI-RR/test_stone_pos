import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/common/domain/repositories/i_item_pedido_repository.dart';
import 'package:easyfood_app/features/common/presentation/widgets/snack_bar_widget.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/mesa_entity.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/status_mesa.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/repositories/i_conta_mesa_repository.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/usecases/get_conta_mesa_com_itens_por_mesa_usecase.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/dialogs/dialog_detalhes_conta.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/pages/detalhes_conta_page.dart';
import 'package:easyfood_app/features/realizar_pedido/presentation/pages/pedido_page.dart';
import 'package:easyfood_app/service_locator.dart';
import 'package:flutter/material.dart';

class MesasTileWidget extends StatefulWidget {
  final MesaEntity mesa;

  const MesasTileWidget(this.mesa, {super.key});

  @override
  State<MesasTileWidget> createState() => _MesasTileWidgetState();
}

class _MesasTileWidgetState extends State<MesasTileWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.mesa.bloqueada ? null : () => _handleTap(context),
      onLongPress: () => _handleLongPress(context),
      child: Card(
        color: widget.mesa.status.color.withOpacity(widget.mesa.bloqueada ? 0.3 : 0.5),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/dinner-table-background.webp'),
              fit: BoxFit.cover,
              opacity: .18,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: widget.mesa.bloqueada,
                child: const Icon(Icons.lock),
              ),
              Text(
                widget.mesa.codigo.toString(),
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Visibility(
                visible: widget.mesa.cliente != null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    widget.mesa.cliente ?? '',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLongPress(BuildContext context) async {
    final conta = await _loadConta();
    if (conta != null && context.mounted) {
      showDialog(context: context, builder: (_) => DialogDetalhesConta(conta));
    }
  }

  void _handleTap(BuildContext context) async {
    final navigator = Navigator.of(context);
    if (widget.mesa.status == StatusMesa.livre) {
      final success = await navigator.push<bool>(
        MaterialPageRoute(builder: (_) => PedidoPage(mesa: widget.mesa)),
      );
      if (success == true) {
        setState(() {
          widget.mesa.status = StatusMesa.ocupada;
        });
      }
      return;
    }

    _showLoadContaDialog(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final conta = await _loadConta();
    conta?.mesa = widget.mesa; // WebService não traz informações de nomeCliente, celularCliente e observacao
    navigator.pop(); // Pop the dialog

    if (conta != null) {
      if (conta.mesa.status == StatusMesa.fechamento) {
        navigator.push(MaterialPageRoute(builder: (_) => DetalhesContaPage(conta)));
      } else {
        navigator.push(MaterialPageRoute(builder: (_) => PedidoPage(conta: conta)));
      }
    } else {
      if (!context.mounted) {
        return;
      }

      scaffoldMessenger.showSnackBar(
        SnackBarWidget.error(context, 'Não foi possível carregar a conta da mesa ${widget.mesa.codigo}'),
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

  Future<ContaMesaEntity?> _loadConta() async {
    final contaMesaRepository = getIt<IContaMesaRepository>();
    final itemPedidoRepository = getIt<IItemPedidoRepository>();
    final useCase = GetContaMesaComItensPorMesaUseCase(contaMesaRepository, itemPedidoRepository);
    final params = GetContaMesaComItensPorMesaUseCaseParams(mesaId: widget.mesa.codigo);
    final result = await useCase.call(params);

    if (result.isSuccess) {
      return result.asSuccess!.value;
    }
    return null;
  }
}
