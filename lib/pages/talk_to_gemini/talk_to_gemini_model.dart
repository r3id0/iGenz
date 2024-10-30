import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'talk_to_gemini_widget.dart' show TalkToGeminiWidget;
import 'package:flutter/material.dart';

class TalkToGeminiModel extends FlutterFlowModel<TalkToGeminiWidget> {
  ///  Local state fields for this page.

  List<GeminiChatsStruct> chats = [];
  void addToChats(GeminiChatsStruct item) => chats.add(item);
  void removeFromChats(GeminiChatsStruct item) => chats.remove(item);
  void removeAtIndexFromChats(int index) => chats.removeAt(index);
  void insertAtIndexInChats(int index, GeminiChatsStruct item) =>
      chats.insert(index, item);
  void updateChatsAtIndex(int index, Function(GeminiChatsStruct) updateFn) =>
      chats[index] = updateFn(chats[index]);

  String currenPrompt = ' ';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for userPrompt widget.
  FocusNode? userPromptFocusNode;
  TextEditingController? userPromptTextController;
  String? Function(BuildContext, String?)? userPromptTextControllerValidator;
  String? _userPromptTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Gemini - Generate Text] action in IconButton widget.
  String? geminiResponse;

  @override
  void initState(BuildContext context) {
    userPromptTextControllerValidator = _userPromptTextControllerValidator;
  }

  @override
  void dispose() {
    userPromptFocusNode?.dispose();
    userPromptTextController?.dispose();
  }
}
