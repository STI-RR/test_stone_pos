import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DialogInserirNumeroWidget extends StatefulWidget {
  final String titulo;
  final String? initialValue;
  final void Function(int)? onConfirm;

  const DialogInserirNumeroWidget(
    this.titulo, {
    super.key,
    this.initialValue,
    this.onConfirm,
  });

  @override
  State<DialogInserirNumeroWidget> createState() => _DialogInserirNumeroWidgetState();
}

class _DialogInserirNumeroWidgetState extends State<DialogInserirNumeroWidget> {
  final _controller = TextEditingController();
  bool edited = false;

  @override
  void initState() {
    _controller.text = widget.initialValue ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(child: Text(widget.titulo, style: Theme.of(context).textTheme.headlineSmall)),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(FontAwesomeIcons.x),
                iconSize: 12,
                padding: EdgeInsets.zero,
                alignment: Alignment.topRight,
              ),
            ],
          ),
          TextField(
            controller: _controller,
            style: Theme.of(context).textTheme.headlineMedium,
            enabled: false,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            children: [_numero('1'), const SizedBox(width: 8), _numero('2'), const SizedBox(width: 8), _numero('3')],
          ),
          const SizedBox(height: 8),
          Row(
            children: [_numero('4'), const SizedBox(width: 8), _numero('5'), const SizedBox(width: 8), _numero('6')],
          ),
          const SizedBox(height: 8),
          Row(
            children: [_numero('7'), const SizedBox(width: 8), _numero('8'), const SizedBox(width: 8), _numero('9')],
          ),
          const SizedBox(height: 8),
          Row(
            children: [_deletar(), const SizedBox(width: 8), _numero('0'), const SizedBox(width: 8), _confirmar()],
          ),
        ],
      ),
    );
  }

  Widget _numero(String value) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            if (edited) {
              _controller.text = _controller.text + value;
            } else {
              _controller.text = value;
              edited = true;
            }
          });
        },
        child: _Numero(value),
      ),
    );
  }

  Widget _deletar() {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            if (_controller.text.isNotEmpty) {
              _controller.text = _controller.text.substring(0, _controller.text.length - 1);
            }
          });
        },
        onLongPress: () {
          setState(() {
            _controller.text = '';
          });
        },
        child: const _Deletar(),
      ),
    );
  }

  Widget _confirmar() {
    return Expanded(
      child: InkWell(
        onTap: () {
          widget.onConfirm?.call(int.parse(_controller.text));
          Navigator.of(context).pop(int.tryParse(_controller.text));
        },
        child: const _Confirmar(),
      ),
    );
  }
}

class _Numero extends StatelessWidget {
  final String value;

  const _Numero(this.value);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 50, minHeight: 50),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Theme.of(context).colorScheme.primary,
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class _Deletar extends StatelessWidget {
  const _Deletar();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 50, minHeight: 50),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.red,
        ),
        alignment: Alignment.center,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.backspace),
        ),
      ),
    );
  }
}

class _Confirmar extends StatelessWidget {
  const _Confirmar();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 50, minHeight: 50),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.green,
        ),
        alignment: Alignment.center,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.check),
        ),
      ),
    );
  }
}
