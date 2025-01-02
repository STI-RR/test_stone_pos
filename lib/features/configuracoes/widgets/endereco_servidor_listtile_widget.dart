import 'package:easyfood_app/features/configuracoes/state/configuracoes_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnderecoServidorListTileWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  EnderecoServidorListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Endereço do servidor'),
      subtitle: Text(context.watch<ConfiguracoesState>().enderecoServidor ?? ''),
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Endereço do servidor'),
          content: Form(
            key: _formKey,
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'http://localhost:8080/app'),
              controller: TextEditingController(text: context.read<ConfiguracoesState>().enderecoServidor),
              onSaved: (value) => context.read<ConfiguracoesState>().enderecoServidor = value,
              validator: _validateWebServerAddress,
              autofocus: true,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<ConfiguracoesState>().salvarEnderecoServidor();
                  Navigator.pop(context);
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  String? _validateWebServerAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe o endereço do servidor';
    }
    try {
      Uri.parse(value);
    } catch (e) {
      return 'Endereço inválido';
    }
    if (Uri.parse(value).host.isEmpty) {
      return 'Endereço inválido';
    }
    return null;
  }
}
