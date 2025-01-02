import 'package:flutter/material.dart';

enum StatusComanda {
  livre(Colors.green),
  ocupada(Colors.red),
  fechamento(Colors.yellow);

  final Color color;

  const StatusComanda(this.color);
}
