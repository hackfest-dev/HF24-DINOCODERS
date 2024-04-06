import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chatbot_widget.dart' show ChatbotWidget;
import 'package:flutter/material.dart';

class ChatbotModel extends FlutterFlowModel<ChatbotWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  ChatRecord? prompt;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? gresult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
