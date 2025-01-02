import 'package:easyfood_app/features/login/presentation/pages/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SenhaTextFormField extends StatefulWidget {
  const SenhaTextFormField({super.key});

  @override
  State<SenhaTextFormField> createState() => _SenhaTextFormFieldState();
}

class _SenhaTextFormFieldState extends State<SenhaTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<LoginController>().senhaController,
      onChanged: (value) => context.read<LoginController>().clearErrorMessage(),
      decoration: InputDecoration(
        labelText: 'Senha',
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
      autofocus: true,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Senha é obrigatória';
        }
        return null;
      },
    );
  }
}
