import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/structs/index.dart';
import '/components/chats_empty_state_widget.dart';
import '/components/my_chat_bubble_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'talk_to_gemini_model.dart';
export 'talk_to_gemini_model.dart';

class TalkToGeminiWidget extends StatefulWidget {
  /// gemini multi-query chat integration page
  const TalkToGeminiWidget({super.key});

  @override
  State<TalkToGeminiWidget> createState() => _TalkToGeminiWidgetState();
}

class _TalkToGeminiWidgetState extends State<TalkToGeminiWidget>
    with TickerProviderStateMixin {
  late TalkToGeminiModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TalkToGeminiModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await _model.listViewController?.animateTo(
            _model.listViewController!.position.maxScrollExtent,
            duration: const Duration(milliseconds: 100),
            curve: Curves.ease,
          );
        }(),
      );
    });

    _model.newAIroleTextController ??= TextEditingController();
    _model.newAIroleFocusNode ??= FocusNode();

    _model.userPromptTextController ??= TextEditingController();
    _model.userPromptFocusNode ??= FocusNode();
    _model.userPromptFocusNode!.addListener(
      () async {
        _model.showClearChat = false;
        safeSetState(() {});
      },
    );
    animationsMap.addAll({
      'blurOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOutQuint,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOutQuint,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 50.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            '✦ Talk to Gemini',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineLargeFamily),
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 72.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            if ((FFAppState().chats.isNotEmpty) == false)
                              wrapWithModel(
                                model: _model.chatsEmptyStateModel,
                                updateCallback: () => safeSetState(() {}),
                                child: const ChatsEmptyStateWidget(),
                              ),
                            Builder(
                              builder: (context) {
                                final geminiChats = FFAppState().chats.toList();

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: geminiChats.length,
                                  itemBuilder: (context, geminiChatsIndex) {
                                    final geminiChatsItem =
                                        geminiChats[geminiChatsIndex];
                                    return MyChatBubbleWidget(
                                      key: Key(
                                          'Keyr6a_${geminiChatsIndex}_of_${geminiChats.length}'),
                                      message: geminiChatsItem,
                                    );
                                  },
                                  controller: _model.listViewController,
                                );
                              },
                            ),
                            if (_model.editSystemMessage)
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (animationsMap[
                                            'blurOnActionTriggerAnimation'] !=
                                        null) {
                                      await animationsMap[
                                              'blurOnActionTriggerAnimation']!
                                          .controller
                                          .reverse();
                                    }
                                    _model.editSystemMessage = false;
                                    safeSetState(() {});
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 2.0,
                                        sigmaY: 2.0,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 8.0),
                                              child: Text(
                                                'Gemini\'s role',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Form(
                                                      key: _model.formKey2,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .always,
                                                      child: SizedBox(
                                                        width: 200.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .newAIroleTextController,
                                                          focusNode: _model
                                                              .newAIroleFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                            hintText:
                                                                'edit AI role...',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                          maxLines: 3,
                                                          minLines: 1,
                                                          maxLength: 500,
                                                          buildCounter: (context,
                                                                  {required currentLength,
                                                                  required isFocused,
                                                                  maxLength}) =>
                                                              null,
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          validator: _model
                                                              .newAIroleTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      if (_model.formKey2
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey2
                                                              .currentState!
                                                              .validate()) {
                                                        return;
                                                      }
                                                      FFAppState()
                                                              .systemMessage =
                                                          _model
                                                              .newAIroleTextController
                                                              .text;
                                                      safeSetState(() {});
                                                      if (animationsMap[
                                                              'blurOnActionTriggerAnimation'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'blurOnActionTriggerAnimation']!
                                                            .controller
                                                            .reverse();
                                                      }
                                                      _model.editSystemMessage =
                                                          false;
                                                      safeSetState(() {});
                                                    },
                                                    text: 'Save',
                                                    options: FFButtonOptions(
                                                      height: 35.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    borderRadius: 8.0,
                                                    buttonSize: 35.0,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    icon: Icon(
                                                      Icons.refresh_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 15.0,
                                                    ),
                                                    onPressed: () async {
                                                      FFAppState()
                                                              .systemMessage =
                                                          'You and the user are happy-go-lucky gen-z';
                                                      safeSetState(() {});
                                                      safeSetState(() {
                                                        _model
                                                            .newAIroleTextController
                                                            ?.clear();
                                                      });
                                                      if (animationsMap[
                                                              'blurOnActionTriggerAnimation'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'blurOnActionTriggerAnimation']!
                                                            .controller
                                                            .reverse();
                                                      }
                                                      _model.editSystemMessage =
                                                          false;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'blurOnActionTriggerAnimation']!,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (false)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://picsum.photos/seed/171/600',
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Form(
                                  key: _model.formKey1,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: SizedBox(
                                    width: 200.0,
                                    child: TextFormField(
                                      controller:
                                          _model.userPromptTextController,
                                      focusNode: _model.userPromptFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                        alignLabelWithHint: false,
                                        hintText: 'ask gemini a question...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      maxLines: 3,
                                      minLines: 1,
                                      maxLength: 300,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      validator: _model
                                          .userPromptTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                icon: const Icon(
                                  Icons.send_rounded,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  if (_model.formKey1.currentState == null ||
                                      !_model.formKey1.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  FFAppState().prompt =
                                      _model.userPromptTextController.text;
                                  FFAppState().addToChats(ChatStruct(
                                    text: _model.userPromptTextController.text,
                                    role: 'user',
                                  ));
                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.userPromptTextController?.clear();
                                  });
                                  await Future.delayed(
                                      const Duration(milliseconds: 500));
                                  await _model.listViewController?.animateTo(
                                    _model.listViewController!.position
                                        .maxScrollExtent,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                  FFAppState().addToChats(ChatStruct(
                                    text: '',
                                    role: 'model',
                                  ));
                                  safeSetState(() {});
                                  _model.response = await GeminiChatCall.call(
                                    messagesJson: functions.formatMessages(
                                        FFAppState().chats.toList()),
                                    systemMessage: FFAppState().systemMessage,
                                  );
                                  if (_model.response?.succeeded ?? true) {
                                    _model.response?.streamedResponse?.stream
                                        .transform(utf8.decoder)
                                        .transform(const LineSplitter())
                                        .transform(
                                            ServerSentEventLineTransformer())
                                        .map((m) =>
                                            ResponseStreamMessage(message: m))
                                        .listen(
                                      (onMessageInput) async {
                                        FFAppState().updateChatsAtIndex(
                                          FFAppState().chats.length - 1,
                                          (e) => e
                                            ..text =
                                                '${FFAppState().chats[FFAppState().chats.length - 1].text}${GeminiChatCall.segment(
                                              onMessageInput
                                                  .serverSentEvent.jsonData,
                                            )}',
                                        );
                                        safeSetState(() {});
                                        await _model.listViewController
                                            ?.animateTo(
                                          _model.listViewController!.position
                                              .maxScrollExtent,
                                          duration: const Duration(milliseconds: 150),
                                          curve: Curves.ease,
                                        );
                                      },
                                      onError: (onErrorInput) async {
                                        FFAppState().addToChats(ChatStruct(
                                          text:
                                              'Oops, sorry that didn\'t go through. Try again or refresh!',
                                          role: 'model',
                                        ));
                                        safeSetState(() {});
                                      },
                                      onDone: () async {
                                        await _model.listViewController
                                            ?.animateTo(
                                          _model.listViewController!.position
                                              .maxScrollExtent,
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                    );
                                  }

                                  await Future.delayed(
                                      const Duration(milliseconds: 300));
                                  await _model.listViewController?.animateTo(
                                    _model.listViewController!.position
                                        .maxScrollExtent,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );

                                  safeSetState(() {});
                                },
                              ),
                              Builder(
                                builder: (context) {
                                  if (!_model.showClearChat) {
                                    return FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      icon: Icon(
                                        Icons.more_vert_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.showClearChat = true;
                                        safeSetState(() {});
                                      },
                                    );
                                  } else {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onLongPress: () async {
                                        safeSetState(() {
                                          _model.newAIroleTextController?.text =
                                              FFAppState().systemMessage;
                                          _model.newAIroleTextController
                                                  ?.selection =
                                              TextSelection.collapsed(
                                                  offset: _model
                                                      .newAIroleTextController!
                                                      .text
                                                      .length);
                                        });
                                        _model.editSystemMessage = true;
                                        safeSetState(() {});
                                        if (animationsMap[
                                                'blurOnActionTriggerAnimation'] !=
                                            null) {
                                          await animationsMap[
                                                  'blurOnActionTriggerAnimation']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                      },
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().deleteChats();
                                          FFAppState().chats = [];

                                          safeSetState(() {});
                                          _model.showClearChat = false;
                                          safeSetState(() {});
                                        },
                                        text: 'Clear chat',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ]
                                .divide(const SizedBox(width: 8.0))
                                .around(const SizedBox(width: 8.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
