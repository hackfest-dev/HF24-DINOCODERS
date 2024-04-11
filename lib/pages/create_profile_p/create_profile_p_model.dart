import '/components/edit_profile_p/edit_profile_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_profile_p_widget.dart' show CreateProfilePWidget;
import 'package:flutter/material.dart';

class CreateProfilePModel extends FlutterFlowModel<CreateProfilePWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for EditProfileP component.
  late EditProfilePModel editProfilePModel;

  @override
  void initState(BuildContext context) {
    editProfilePModel = createModel(context, () => EditProfilePModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    editProfilePModel.dispose();
  }
}
