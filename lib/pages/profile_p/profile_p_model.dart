import '/flutter_flow/flutter_flow_util.dart';
import 'profile_p_widget.dart' show ProfilePWidget;
import 'package:flutter/material.dart';

class ProfilePModel extends FlutterFlowModel<ProfilePWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
