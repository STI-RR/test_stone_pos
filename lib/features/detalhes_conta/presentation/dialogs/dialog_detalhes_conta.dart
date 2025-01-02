import 'package:easyfood_app/core/util/date_util.dart';
import 'package:easyfood_app/core/util/telefone_input_formatter.dart';
import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/common/presentation/widgets/snack_bar_widget.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/widgets/button_transferir_conta_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class DialogDetalhesConta extends StatefulWidget {
  final ContaEntity conta;

  const DialogDetalhesConta(this.conta, {super.key});

  @override
  State<DialogDetalhesConta> createState() => _DialogDetalhesContaState();
}

class _DialogDetalhesContaState extends State<DialogDetalhesConta> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _nomeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _telefone;
  final bool _inAsyncCall = false;

  @override
  void dispose() {
    _scrollController.dispose();
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _inAsyncCall,
      child: AlertDialog(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: Text(widget.conta.descricao())),
                Text(
                  'Conta ${widget.conta.codigo}',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),
                ),
              ],
            ),
            _ObservacaoConta(widget.conta),
          ],
        ),
        content: SingleChildScrollView(
          controller: _scrollController,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(),
                const Text('Início:', style: TextStyle(fontWeight: FontWeight.w800)),
                Text(DateUtil.getFormattedDateTime(widget.conta.dataHoraAbertura)),
                const SizedBox(height: 16),
                _ClienteConta(widget.conta),
                const Text('Funcionário abertura:', style: TextStyle(fontWeight: FontWeight.w800)),
                Text(widget.conta.funcionarioAbertura?.nome ?? 'Não informado'),
                const SizedBox(height: 16),
                const Text('Cliente:', style: TextStyle(fontWeight: FontWeight.w800)),
                if (widget.conta.cliente != null) Text(widget.conta.cliente?.nome ?? ''),
                if (widget.conta.cliente == null)
                  SizedBox(
                    height: 22,
                    child: TextFormField(
                      controller: _nomeController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: -24),
                      ),
                      onTap: () => _jumpToEnd(),
                      validator: _nomeValidator,
                    ),
                  ),
                const SizedBox(height: 16),
                const Text('Telefone:', style: TextStyle(fontWeight: FontWeight.w800)),
                if (widget.conta.cliente != null) Text(widget.conta.cliente?.telefone ?? ''),
                if (widget.conta.cliente == null)
                  SizedBox(
                    height: 20,
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: '(__) _ ____-____',
                        contentPadding: EdgeInsets.only(top: -28),
                      ),
                      onTap: () => _jumpToEnd(),
                      validator: _telefoneValidator,
                    ),
                  ),
                if (widget.conta is ContaDeliveryEntity)
                  if ((widget.conta as ContaDeliveryEntity).enderecoEntrega != null) ...[
                    const SizedBox(height: 16),
                    const Text('Endereço de entrega:', style: TextStyle(fontWeight: FontWeight.w800)),
                    Text((widget.conta as ContaDeliveryEntity).enderecoEntrega!.enderecoCompleto),
                  ],
              ],
            ),
          ),
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ButtonTransferirContaWidget(widget.conta),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () => _ok(context), child: const Text('OK')),
          ),
        ],
      ),
    );
  }

  String? _telefoneValidator(String? value) {
    if (widget.conta.cliente != null) {
      // Não precisa validar se a conta já tem cliente
      return null;
    }
    if (value == null || value.isEmpty) {
      // Não precisa validar se o usuário não informou o telefone
      return null;
    }
    if (value.length < 16) {
      return ' ';
    }
    return null;
  }

  String? _nomeValidator(String? value) {
    if (widget.conta.cliente != null) {
      // Não precisa validar se a conta já tem cliente
      return null;
    }
    if (_telefone == null || _telefone?.isEmpty == true) {
      // Não precisa validar se o usuário não informou o telefone
      return null;
    }
    if (value == null || value.isEmpty) {
      return 'Informe o nome do cliente';
    }
    return null;
  }

  void _jumpToEnd() {
    Future.delayed(const Duration(milliseconds: 500)).then(
      (value) {
        final maxExtend = _scrollController.position.maxScrollExtent;
        _scrollController.animateTo(
          maxExtend == 0 ? 101 : maxExtend,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    );
  }

  void _ok(BuildContext context) {
    if (_formKey.currentState?.validate() == true) {
      if (_nomeController.text.isNotEmpty && _telefone != null) {
        cadastrarCliente();
      }
      Navigator.of(context).pop();
    }
  }

  void cadastrarCliente() async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBarWidget.success(context, 'Cliente cadastrado com sucesso'));
  }
}

class _ObservacaoConta extends StatelessWidget {
  const _ObservacaoConta(this.conta);

  final ContaEntity conta;

  @override
  Widget build(BuildContext context) {
    String? observacao;
    if (conta is ContaMesaEntity) {
      observacao = (conta as ContaMesaEntity).mesa.observacao;
    } else if (conta is ContaComandaEntity) {
      observacao = (conta as ContaComandaEntity).comanda.observacao;
    }

    if (observacao == null || observacao.isEmpty) {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        observacao,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _ClienteConta extends StatelessWidget {
  final ContaEntity conta;

  const _ClienteConta(this.conta);

  @override
  Widget build(BuildContext context) {
    String? cliente;
    if (conta is ContaMesaEntity) {
      cliente = (conta as ContaMesaEntity).mesa.cliente;
    } else if (conta is ContaComandaEntity) {
      cliente = (conta as ContaComandaEntity).comanda.cliente;
    }

    if (cliente == null || cliente.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Cliente:', style: TextStyle(fontWeight: FontWeight.w800)),
        Text(cliente),
        const SizedBox(height: 16),
      ],
    );
  }
}
