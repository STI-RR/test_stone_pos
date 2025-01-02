import 'package:easyfood_app/features/common/domain/entities/comanda_entity.dart';
import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';
import 'package:easyfood_app/features/common/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DialogTransferenciaItemComanda extends StatefulWidget {
  final ComandaEntity comanda;
  final ItemPedidoEntity item;

  const DialogTransferenciaItemComanda({
    super.key,
    required this.comanda,
    required this.item,
  });

  @override
  State<DialogTransferenciaItemComanda> createState() => _DialogTransferenciaItemComandaState();
}

class _DialogTransferenciaItemComandaState extends State<DialogTransferenciaItemComanda> {
  final formKey = GlobalKey<FormBuilderState>();
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.shuffle),
      title: const Text('Transferência de itens'),
      content: SingleChildScrollView(
        controller: _controller,
        reverse: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Para onde deseja transferir o item ${widget.item.descricao}?'),
            FormBuilder(
              key: formKey,
              child: FormBuilderTextField(
                name: 'destino',
                decoration: const InputDecoration(
                  labelText: 'Comanda de destino',
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.center,
                autofocus: true,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(errorText: 'Informe o número da comanda'),
                    FormBuilderValidators.numeric(errorText: 'Informe um número válido'),
                    FormBuilderValidators.notEqual(widget.comanda.codigo.toString(),
                        errorText: 'Informe um número diferente'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: _handleTransferir,
          child: const Text('Transferir'),
        ),
      ],
    );
  }

  void _handleTransferir() async {
    if (!formKey.currentState!.saveAndValidate()) {
      _controller.jumpTo(0);
      return;
    }

    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(
      SnackBarWidget.success(context, 'Item transferido com sucesso'),
    );
  }
}
