import 'package:flutter/material.dart';

enum StatusMesa {
  livre(Colors.green),
  ocupada(Colors.red),
  fechamento(Colors.yellow);

  final Color color;

  const StatusMesa(this.color);
}
