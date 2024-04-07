import '/flutter_flow/flutter_flow_util.dart';
import 'homepage_p_widget.dart' show HomepagePWidget;
import 'package:flutter/material.dart';

class HomepagePModel extends FlutterFlowModel<HomepagePWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
