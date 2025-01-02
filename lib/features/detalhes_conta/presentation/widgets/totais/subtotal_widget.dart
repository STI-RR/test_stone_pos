import 'package:easyfood_app/core/util/number_util.dart';
import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:flutter/material.dart';

class SubtotalWidget extends StatelessWidget {
  final ContaEntity conta;
  const SubtotalWidget(this.conta, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          const Expanded(child: Text('Subtotal')),
          Text(NumberUtil.formatCurrency(conta.subTotal)),
        ],
      ),
    );
  }
}
