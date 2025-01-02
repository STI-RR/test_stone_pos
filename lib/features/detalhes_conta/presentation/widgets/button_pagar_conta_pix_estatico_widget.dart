import 'package:flutter/material.dart';

class ButtonPagarContaPixEstaticoWidget extends StatelessWidget {
  final void Function()? onPressed;
  final verdePix = const Color(0xFF77B6A8); // Manual de uso da marca v1.3 de 17 de setembro de 2021
  final cinzaPix = const Color(0xFF96969A); // Manual de uso da marca v1.3 de 17 de setembro de 2021

  const ButtonPagarContaPixEstaticoWidget({
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
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: verdePix,
          shadowColor: cinzaPix,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pix),
            SizedBox(width: 8.0),
            Text('Pagar com PIX estático'),
          ],
        ),
      ),
    );
  }
}
