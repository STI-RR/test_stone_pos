import 'package:easyfood_app/features/common/domain/entities/comanda_entity.dart';
import 'package:easyfood_app/features/common/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DialogTransferenciaComanda extends StatefulWidget {
  final ComandaEntity comanda;

  const DialogTransferenciaComanda(this.comanda, {super.key});

  @override
  State<DialogTransferenciaComanda> createState() => _DialogTransferenciaComandaState();
}

class _DialogTransferenciaComandaState extends State<DialogTransferenciaComanda> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.shuffle),
      title: const Text('Transferência de comanda'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Para onde deseja transferir a comanda ${widget.comanda.codigo}?'),
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Informe o número da comanda'),
                    FormBuilderValidators.numeric(errorText: 'Informe um número válido'),
                  ])),
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
          onPressed: () async {
            if (!formKey.currentState!.saveAndValidate()) return;

            final navigator = Navigator.of(context);
            final scaffoldMessenger = ScaffoldMessenger.of(context);

            navigator.pop(); // Pop one mode to close page
            scaffoldMessenger.showSnackBar(
              SnackBarWidget.success(context, 'Comanda transferida com sucesso'),
            );
          },
          child: const Text('Transferir'),
        ),
      ],
    );
  }
}
