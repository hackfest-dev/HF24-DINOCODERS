import '/flutter_flow/flutter_flow_util.dart';
import 'list_p_widget.dart' show ListPWidget;
import 'package:flutter/material.dart';

class ListPModel extends FlutterFlowModel<ListPWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
