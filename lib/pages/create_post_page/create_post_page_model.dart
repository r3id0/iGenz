import '/flutter_flow/flutter_flow_util.dart';
import 'create_post_page_widget.dart' show CreatePostPageWidget;
import 'package:flutter/material.dart';

class CreatePostPageModel extends FlutterFlowModel<CreatePostPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for Caption widget.
  FocusNode? captionFocusNode;
  TextEditingController? captionTextController;
  String? Function(BuildContext, String?)? captionTextControllerValidator;
  String? _captionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'caption must be filled out';
    }

    if (val.length > 1024) {
      return 'Maximum 1024 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    captionTextControllerValidator = _captionTextControllerValidator;
  }

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    captionFocusNode?.dispose();
    captionTextController?.dispose();
  }
}
