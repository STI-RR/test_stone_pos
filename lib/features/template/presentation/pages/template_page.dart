import 'package:easyfood_app/features/template/presentation/states/template_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TemplateState()),
      ],
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text('Template Page'),
        ),
        body: const Center(
          child: Text('Template Page'),
        ),
      )),
    );
  }
}
