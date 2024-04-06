import '/flutter_flow/flutter_flow_util.dart';
import 'telegram_widget.dart' show TelegramWidget;
import 'package:flutter/material.dart';

class TelegramModel extends FlutterFlowModel<TelegramWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
