import 'package:easyfood_app/features/login/presentation/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final state = context.watch<LoginState>();
        if (state.errorMessage == null) {
          return const SizedBox.shrink();
        } else {
          return ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 150),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error,
                borderRadius: BorderRadius.circular(4),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      state.errorMessage!,
                      style: TextStyle(color: Theme.of(context).colorScheme.onError),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
