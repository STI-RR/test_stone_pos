import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';
import 'package:easyfood_app/features/common/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DialogCancelamentoItem extends StatefulWidget {
  final ItemPedidoEntity item;

  const DialogCancelamentoItem({
    super.key,
    required this.item,
  });

  @override
  State<DialogCancelamentoItem> createState() => _DialogCancelamentoItemState();
}

class _DialogCancelamentoItemState extends State<DialogCancelamentoItem> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.delete),
      title: const Text('Cancelamento de itens'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Deseja realmente cancelar o item ${widget.item.descricao}?'),
            FormBuilder(
              key: formKey,
              child: FormBuilderTextField(
                name: 'motivo',
                decoration: const InputDecoration(
                  labelText: 'Informe o motivo aqui!',
                ),
                textAlign: TextAlign.center,
                validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(errorText: 'Informe o motivo do cancelamento')],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              height: 40,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      formKey.currentState!.fields['motivo']!.didChange('Cliente cancelou');
                    },
                    child: const Text('Cliente cancelou'),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: () {
                      formKey.currentState!.fields['motivo']!.didChange('Acabou no estoque');
                    },
                    child: const Text('Acabou no estoque'),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: () {
                      formKey.currentState!.fields['motivo']!.didChange('Lançado errado');
                    },
                    child: const Text('Lançado errado'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Voltar'),
        ),
        TextButton(
          onPressed: _handleCancelar,
          child: const Text('Confirmar'),
        ),
      ],
    );
  }

  void _handleCancelar() async {
    if (!formKey.currentState!.saveAndValidate()) return;

    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    navigator.pop('reload');
    scaffoldMessenger.showSnackBar(
      SnackBarWidget.success(context, 'Item cancelado com sucesso'),
    );
  }
}
