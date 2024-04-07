import '/flutter_flow/flutter_flow_util.dart';
import 'lists_widget.dart' show ListsWidget;
import 'package:flutter/material.dart';

class ListsModel extends FlutterFlowModel<ListsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
