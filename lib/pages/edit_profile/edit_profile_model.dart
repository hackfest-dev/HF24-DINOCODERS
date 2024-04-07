import '/flutter_flow/flutter_flow_util.dart';
import '/pages/edit_profile_c/edit_profile_c_widget.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for EditProfileC component.
  late EditProfileCModel editProfileCModel;

  @override
  void initState(BuildContext context) {
    editProfileCModel = createModel(context, () => EditProfileCModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    editProfileCModel.dispose();
  }
}
