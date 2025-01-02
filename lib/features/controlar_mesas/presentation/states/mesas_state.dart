import 'dart:async';

import 'package:easyfood_app/features/controlar_mesas/domain/entities/mesa_entity.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/status_mesa.dart';
import 'package:flutter/material.dart';

class MesasState extends ChangeNotifier {
  final List<MesaEntity> _mesas = [];
  StatusMesa? _filter;
  Timer? timerToReload;

  List<MesaEntity> get mesas =>
      _filter == null ? _mesas : _mesas.where((element) => element.status == _filter).toList();

  void init() async {
    await _reload();
    timerToReload = Timer.periodic(const Duration(seconds: 10), (timer) => _reload());
  }

  Future<void> _reload() async {}

  @override
  void dispose() {
    timerToReload?.cancel();
    super.dispose();
  }

  void filter(StatusMesa? value) {
    _filter = value;
    notifyListeners();
  }
}
