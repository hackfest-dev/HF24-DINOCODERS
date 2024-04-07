import '/flutter_flow/flutter_flow_util.dart';
import 'add_list_element_widget.dart' show AddListElementWidget;
import 'package:flutter/material.dart';

class AddListElementModel extends FlutterFlowModel<AddListElementWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for Price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceController;
  String? Function(BuildContext, String?)? priceControllerValidator;
  // State field(s) for Details widget.
  FocusNode? detailsFocusNode;
  TextEditingController? detailsController;
  String? Function(BuildContext, String?)? detailsControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameController?.dispose();

    priceFocusNode?.dispose();
    priceController?.dispose();

    detailsFocusNode?.dispose();
    detailsController?.dispose();
  }
}
