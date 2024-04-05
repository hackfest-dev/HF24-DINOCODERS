import '/flutter_flow/flutter_flow_util.dart';
import 'phone_widget.dart' show PhoneWidget;
import 'package:flutter/material.dart';

class PhoneModel extends FlutterFlowModel<PhoneWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();
  }
}
