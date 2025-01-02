import 'package:easyfood_app/core/util/app_version.dart';
import 'package:flutter/material.dart';

class VersionInfo extends StatelessWidget {
  const VersionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Versão: ${AppVersion.fullVersion}',
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
