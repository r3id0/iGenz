import '/backend/api_requests/api_calls.dart';
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

  List<String> sender = [];
  void addToSender(String item) => sender.add(item);
  void removeFromSender(String item) => sender.remove(item);
  void removeAtIndexFromSender(int index) => sender.removeAt(index);
  void insertAtIndexInSender(int index, String item) =>
      sender.insert(index, item);
  void updateSenderAtIndex(int index, Function(String) updateFn) =>
      sender[index] = updateFn(sender[index]);

  List<String> message = [];
  void addToMessage(String item) => message.add(item);
  void removeFromMessage(String item) => message.remove(item);
  void removeAtIndexFromMessage(int index) => message.removeAt(index);
  void insertAtIndexInMessage(int index, String item) =>
      message.insert(index, item);
  void updateMessageAtIndex(int index, Function(String) updateFn) =>
      message[index] = updateFn(message[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ListView widget.
  ScrollController? listViewController;
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

  // Stores action output result for [Backend Call - API (GeminiChat)] action in IconButton widget.
  ApiCallResponse? response;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    userPromptTextControllerValidator = _userPromptTextControllerValidator;
  }

  @override
  void dispose() {
    listViewController?.dispose();
    userPromptFocusNode?.dispose();
    userPromptTextController?.dispose();
  }
}
