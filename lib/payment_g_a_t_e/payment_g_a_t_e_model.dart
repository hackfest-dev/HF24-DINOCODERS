import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_g_a_t_e_widget.dart' show PaymentGATEWidget;
import 'package:flutter/material.dart';

class PaymentGATEModel extends FlutterFlowModel<PaymentGATEWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - orderGenerator] action in Button widget.
  String? generatedOrder;
  // Stores action output result for [Backend Call - API (genToken)] action in Button widget.
  ApiCallResponse? apiResult9d5;
  // Stores action output result for [Backend Call - API (verifySignature)] action in Button widget.
  ApiCallResponse? verifypayment;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
