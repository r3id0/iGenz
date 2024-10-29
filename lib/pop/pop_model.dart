import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pop_widget.dart' show PopWidget;
import 'package:flutter/material.dart';

class PopModel extends FlutterFlowModel<PopWidget> {
  ///  Local state fields for this page.

  bool editEnable = false;

  PostsRow? post;

  ///  State fields for stateful widgets in this page.

  // State field(s) for newTitle widget.
  FocusNode? newTitleFocusNode;
  TextEditingController? newTitleTextController;
  String? Function(BuildContext, String?)? newTitleTextControllerValidator;
  // State field(s) for newCaption widget.
  FocusNode? newCaptionFocusNode;
  TextEditingController? newCaptionTextController;
  String? Function(BuildContext, String?)? newCaptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newTitleFocusNode?.dispose();
    newTitleTextController?.dispose();

    newCaptionFocusNode?.dispose();
    newCaptionTextController?.dispose();
  }
}
