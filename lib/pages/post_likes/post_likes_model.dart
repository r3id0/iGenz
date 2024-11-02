import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'post_likes_widget.dart' show PostLikesWidget;
import 'package:flutter/material.dart';

class PostLikesModel extends FlutterFlowModel<PostLikesWidget> {
  ///  Local state fields for this page.

  String sentCommentID = ' ';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  Completer<List<CommentsRow>>? requestCompleter2;
  bool requestCompleted1 = false;
  String? requestLastUniqueKey1;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;
  String? _commentTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  CommentsRow? sentComment;

  @override
  void initState(BuildContext context) {
    commentTextControllerValidator = _commentTextControllerValidator;
  }

  @override
  void dispose() {
    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted1;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
