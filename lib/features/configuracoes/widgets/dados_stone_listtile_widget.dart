import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/configuracoes/domain/usecases/get_flavor_info_usecase.dart';
import 'package:easyfood_app/features/configuracoes/domain/usecases/get_stone_code_usecase.dart';
import 'package:easyfood_app/features/configuracoes/domain/usecases/save_stone_code_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DadosStoneListTileWidget extends StatelessWidget {
  const DadosStoneListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Dados Stone'),
      subtitle: const Text('Configurações de integração com a Stone'),
      onTap: () => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Dados Stone'),
          content: FutureBuilder<String>(
            future: getFlavorInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData || snapshot.hasError) {
                return _StoneData(snapshot.data ?? '');
              }
              return const CircularProgressIndicator();
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fechar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> getFlavorInfo() async {
    final useCase = GetFlavorInfoUseCase();
    final result = await useCase.call(const NoParams());

    if (result.isSuccess) {
      return result.asSuccess!.value;
    } else {
      return result.asFailure!.message;
    }
  }
}

class _StoneData extends StatefulWidget {
  final String data;

  const _StoneData(this.data);

  @override
  State<_StoneData> createState() => _StoneDataState();
}

class _StoneDataState extends State<_StoneData> {
  var stoneCode = '';
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    stoneCode = _extractNumberFromString(widget.data)?.toString() ?? '';
    _controller = TextEditingController(text: stoneCode);
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (stoneCode.isEmpty) {
      _getStoneCodeFromSharedPreferences();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'Digite o Stone Code',
          ),
          maxLength: 9,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          autocorrect: false,
          enableSuggestions: false,
          onChanged: (value) => stoneCode = value,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _ContainerAlertaReinicializacaoApp(),
        ),
        TextButton(
          onPressed: _saveStoneCode,
          child: const Text('Salvar'),
        ),
      ],
    );
  }

  int? _extractNumberFromString(String value) {
    final number = int.tryParse(value.replaceAll(RegExp(r'[^0-9]'), ''));
    return number;
  }

  Future<void> _getStoneCodeFromSharedPreferences() async {
    final useCase = GetStoneCodeUseCase();
    final result = await useCase.call(const NoParams());

    if (result.isSuccess) {
      setState(() {
        stoneCode = result.asSuccess!.value;
      });
    }
  }

  void _saveStoneCode() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final useCase = SaveStoneCodeUseCase();
    final params = SaveStoneCodeUseCaseParams(stoneCode);
    final result = await useCase.call(params);

    if (result.isSuccess) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text('Stone Code salvo com sucesso!'),
        ),
      );
      SystemNavigator.pop(); // Fecha o app para reiniciar o SDK
    } else {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text('Erro ao salvar Stone Code: ${result.asFailure!.message}'),
        ),
      );
    }
  }
}

class _ContainerAlertaReinicializacaoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: RichText(
        text: const TextSpan(
          children: [
            WidgetSpan(child: Icon(Icons.info, size: 16, color: Colors.black54)),
            TextSpan(
              text: ' Ao salvar o Stone Code, o aplicativo será reiniciado para aplicar as configurações. ',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
