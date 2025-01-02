import 'package:flutter/material.dart';

class ButtonPagarContaWidget extends StatelessWidget {
  final void Function()? onPressed;

  const ButtonPagarContaWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.green),
        child: const Text('Pagar conta'),
      ),
    );
  }
}
