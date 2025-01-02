import 'package:flutter/material.dart';

class LoadingScreenContentWidget extends StatelessWidget {
  const LoadingScreenContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
