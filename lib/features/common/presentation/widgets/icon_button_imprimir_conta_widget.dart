import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/common/domain/entities/status_comanda.dart';
import 'package:easyfood_app/features/common/presentation/dialog/dialog_inserir_numero_widget.dart';
import 'package:easyfood_app/features/common/presentation/dialog/printing_dialog_widget.dart';
import 'package:easyfood_app/features/common/presentation/states/auth_state.dart';
import 'package:easyfood_app/features/common/presentation/widgets/icon_button_imprimir_conta_controller.dart';
import 'package:easyfood_app/features/common/presentation/widgets/snack_bar_widget.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/status_mesa.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/dialogs/dialog_opcoes_impressao_conta.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IconButtonImprimirContaWidget extends StatelessWidget {
  final ContaEntity conta;
  final IconButtonImprimirContaController controller;

  IconButtonImprimirContaWidget(this.conta, {super.key}) : controller = IconButtonImprimirContaController(conta);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _imprimirOuFecharConta(context, conta),
      icon: const Icon(Icons.print),
    );
  }

  void _imprimirOuFecharConta(BuildContext context, ContaEntity conta) async {
    final funcionarioId = context.read<AuthState>().usuario!.codigoFuncionario;
    final nomeFuncionario = context.read<AuthState>().usuario!.nomeFuncionario;
    final navigator = Navigator.of(context);
    dynamic choice;

    if (!_podeFechar(conta)) {
      choice = 'previa';
    } else {
      choice = await showDialog<String>(context: context, builder: (_) => const DialogOpcoesImpressaoConta());
    }

    if (!context.mounted || choice == null) {
      return;
    }

    final isMesa = conta is ContaMesaEntity;
    final isComanda = conta is ContaComandaEntity;
    const isPedirPessoasNaComanda = false;

    if (isMesa || (isComanda && isPedirPessoasNaComanda)) {
      final quantidadeDePessoas = await showDialog<int>(
        context: context,
        builder: (_) => const DialogInserirNumeroWidget('Quantidade de pessoas'),
      );

      if (quantidadeDePessoas == null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarWidget.neutral(
              context,
              'Impressão cancelada. Informe a quantidade de pessoas',
              duration: const Duration(seconds: 3),
            ),
          );
        }
        return;
      }
      conta.quantidadeDePessoas = quantidadeDePessoas;
    }

    if (!context.mounted) {
      return;
    }

    if (choice == 'previa') {
      _printPrevia(
        context: context,
        funcionarioId: funcionarioId,
        conta: conta,
        nomeFuncionario: nomeFuncionario,
      );
    } else if (choice == 'conta') {
      _fecharConta(
        context: context,
        funcionarioId: funcionarioId,
        conta: conta,
        navigator: navigator,
      );
    }
  }

  void _fecharConta({
    required BuildContext context,
    required int funcionarioId,
    required ContaEntity conta,
    required NavigatorState navigator,
  }) async {
    int? idCategoriaImpressaoConta;

    await controller.fecharConta(
      funcionarioId: funcionarioId,
      quantidadeDePessoas: conta.quantidadeDePessoas,
      idCategoriaImpressaoConta: idCategoriaImpressaoConta,
    );

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarWidget.success(context, 'Conta fechada com sucesso'),
      );
      navigator.pop();
    }
  }

  void _printPrevia({
    required BuildContext context,
    required int funcionarioId,
    required ContaEntity conta,
    required String nomeFuncionario,
  }) async {
    final value = await controller.imprimirPrevia(
      funcionarioId: funcionarioId,
      quantidadeDePessoas: conta.quantidadeDePessoas,
      nomeFuncionario: nomeFuncionario,
    );

    if (value.isFailure && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarWidget.error(context, 'Erro ao solicitar impressão: ${value.asFailure!.message}'),
      );
    }

    if (controller.isPosPrint && context.mounted) {
      showDialog(context: context, builder: (context) => const PrintingDialogWidget());
    }
  }

  bool _podeFechar(ContaEntity conta) {
    if (conta is ContaDeliveryEntity || conta is ContaPraViagemEntity) {
      return false;
    } else if (conta is ContaComandaEntity) {
      return conta.comanda.status != StatusComanda.fechamento;
    } else if (conta is ContaMesaEntity) {
      return conta.mesa.status != StatusMesa.fechamento;
    } else {
      return false;
    }
  }
}
