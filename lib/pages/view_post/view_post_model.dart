import '/flutter_flow/flutter_flow_util.dart';
import 'view_post_widget.dart' show ViewPostWidget;
import 'package:flutter/material.dart';

class ViewPostModel extends FlutterFlowModel<ViewPostWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
