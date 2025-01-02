import 'package:easyfood_app/core/util/currency_input_formatter.dart';
import 'package:easyfood_app/core/util/number_util.dart';
import 'package:flutter/material.dart';

class DialogAlterarValorPagamento extends StatefulWidget {
  final double initValue;
  final bool acceptZero;

  const DialogAlterarValorPagamento({super.key, required this.initValue, this.acceptZero = false});

  @override
  State<DialogAlterarValorPagamento> createState() => _DialogAlterarValorPagamentoState();
}

class _DialogAlterarValorPagamentoState extends State<DialogAlterarValorPagamento> {
  final _controller = TextEditingController();
  String? errorText;

  @override
  void initState() {
    super.initState();
    _controller.text = NumberUtil.formatCurrency(widget.initValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Editar total'),
      content: TextFormField(
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(labelText: 'Total'),
        inputFormatters: [CurrencyInputFormatter()],
        onChanged: (value) {
          setState(() {
            errorText = null;
          });
        },
        style: const TextStyle(fontSize: 20),
        autofocus: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => errorText,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            final value = NumberUtil.parseCurrency(_controller.text);
            if (widget.acceptZero) {
              if (value < 0) {
                setState(() {
                  errorText = 'O valor deve ser maior ou igual a zero';
                });
                return;
              }
            } else {
              if (value <= 0) {
                setState(() {
                  errorText = 'O valor deve ser maior que zero';
                });
                return;
              }
            }
            Navigator.of(context).pop(value);
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}
