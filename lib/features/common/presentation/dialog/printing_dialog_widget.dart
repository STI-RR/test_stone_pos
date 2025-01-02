import 'package:easyfood_app/flutter_method_channel.dart';
import 'package:flutter/material.dart';

class PrintingDialogWidget extends StatefulWidget {
  const PrintingDialogWidget({super.key});

  @override
  State<PrintingDialogWidget> createState() => _PrintingDialogWidgetState();
}

class _PrintingDialogWidgetState extends State<PrintingDialogWidget> implements FlutterMethodChannelPrintListener {
  @override
  void onPrintError(String message) => Navigator.of(context).pop(message);

  @override
  void onPrintSuccess() => Navigator.of(context).pop();

  @override
  void initState() {
    super.initState();
    FlutterMethodChannel.instance.addPrintListener(this);
  }

  @override
  void dispose() {
    FlutterMethodChannel.instance.removePrintListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Image.asset('assets/gifs/print.gif'),
          ),
          Container(
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Color(0xFFC0DFF4),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Imprimindo...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
