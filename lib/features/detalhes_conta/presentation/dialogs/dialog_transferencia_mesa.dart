import 'package:easyfood_app/features/common/presentation/widgets/snack_bar_widget.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/mesa_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DialogTransferenciaMesa extends StatefulWidget {
  final MesaEntity mesa;

  const DialogTransferenciaMesa(this.mesa, {super.key});

  @override
  State<DialogTransferenciaMesa> createState() => _DialogTransferenciaMesaState();
}

class _DialogTransferenciaMesaState extends State<DialogTransferenciaMesa> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.shuffle),
      title: const Text('Transferência de mesa'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Para onde deseja transferir a mesa ${widget.mesa.codigo}?'),
            FormBuilder(
              key: formKey,
              child: FormBuilderTextField(
                  name: 'destino',
                  decoration: const InputDecoration(
                    labelText: 'Mesa de destino',
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.center,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Informe o número da mesa'),
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
              SnackBarWidget.success(context, 'Mesa transferida com sucesso'),
            );
          },
          child: const Text('Transferir'),
        ),
      ],
    );
  }
}
