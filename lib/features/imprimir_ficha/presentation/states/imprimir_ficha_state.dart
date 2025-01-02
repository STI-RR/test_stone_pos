import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/imprimir_ficha/domain/entities/item_ficha_impressao_entity.dart';
import 'package:easyfood_app/features/imprimir_ficha/domain/usecases/imprimir_ficha_pos_usecase.dart';
import 'package:easyfood_app/flutter_method_channel.dart';
import 'package:flutter/material.dart';

class ImprimirFichaState extends ChangeNotifier implements FlutterMethodChannelPrintListener {
  final ContaEntity conta;
  final List<ItemFichaImpressaoEntity> _itensFicha = [];
  bool _isPrinting = false;

  ItemFichaImpressaoEntity? _printing;
  ItemFichaImpressaoEntity? get printing => _printing;

  ImprimirFichaState(this.conta) : super() {
    conta.itensPedido.where((item) => item.imprimirFichaPos).forEach((item) {
      _itensFicha.add(ItemFichaImpressaoEntity.fromItemPedido(conta.codigo, item));
    });
  }

  List<ItemFichaImpressaoEntity> get item => _itensFicha;

  get noneSelected => _itensFicha.every((element) => !element.selected);
  get allPrinted => _itensFicha.every((element) => element.printed);

  void changeSelection(int index) {
    _itensFicha[index].selected = !_itensFicha[index].selected;
    notifyListeners();
  }

  void print() {
    if (_isPrinting) return;
    _isPrinting = true;

    FlutterMethodChannel.instance.addPrintListener(this);
    if (_itensFicha.any((element) => element.selected && !element.printed)) {
      final first = _itensFicha.firstWhere((item) => item.selected && item.printed == false);
      _printItem(first);
    } else {
      _isPrinting = false;
    }
  }

  void _printItem(ItemFichaImpressaoEntity item) {
    _printing = item;
    notifyListeners();

    final params = ImprimirFichaPosParams(item: item);
    final useCase = ImprimirFichaPosUseCase();
    useCase(params);
  }

  @override
  void onPrintError(String message) {
    _printing = null;
    _isPrinting = false;
    notifyListeners();
  }

  @override
  void onPrintSuccess() {
    _printing?.selected = false;
    _printing?.printed = true;
    _isPrinting = false;
    notifyListeners();

    print();
  }

  @override
  void dispose() {
    FlutterMethodChannel.instance.removePrintListener(this);
    super.dispose();
  }
}
