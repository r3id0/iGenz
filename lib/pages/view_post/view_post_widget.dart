import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/grayloadingwidget_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_post_model.dart';
export 'view_post_model.dart';

class ViewPostWidget extends StatefulWidget {
  /// search page
  const ViewPostWidget({
    super.key,
    required this.post,
  });

  final PostsRow? post;

  @override
  State<ViewPostWidget> createState() => _ViewPostWidgetState();
}

class _ViewPostWidgetState extends State<ViewPostWidget>
    with TickerProviderStateMixin {
  late ViewPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasIconButtonTriggered1 = false;
  var hasIconButtonTriggered2 = false;
  var hasIconButtonTriggered3 = false;
  var hasIconButtonTriggered4 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewPostModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.unsubscribe(
        'comments',
      );
      await actions.unsubscribe(
        'posts',
      );
      await actions.subscribe(
        'comments',
        () async {
          safeSetState(() => _model.requestCompleter2 = null);
          await _model.waitForRequestCompleted2();
          FFAppState().clearFeedCache();
        },
      );
      await actions.subscribe(
        'posts',
        () async {
          safeSetState(() {
            FFAppState().clearFeedCache();
            _model.requestCompleted1 = false;
          });
          await _model.waitForRequestCompleted1();
          FFAppState().clearFeedCache();
        },
      );
    });

    _model.commentTextController ??= TextEditingController();
    _model.commentFocusNode ??= FocusNode();

    animationsMap.addAll({
      'iconButtonOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOutQuint,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-5.0, -5.0),
            end: const Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconButtonOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOutQuint,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-5.0, -5.0),
            end: const Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconButtonOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOutQuint,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-5.0, -5.0),
            end: const Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconButtonOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOutQuint,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-5.0, -5.0),
            end: const Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 10.0),
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
          title: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/heading0.png',
                width: 100.0,
                height: 60.0,
                fit: BoxFit.contain,
                alignment: const Alignment(0.0, 0.0),
              ),
            ),
          ),
          actions: const [],
          centerTitle: true,
        ),
        body: FutureBuilder<List<PostsRow>>(
          future: FFAppState()
              .feed(
            requestFn: () => PostsTable().querySingleRow(
              queryFn: (q) => q.eq(
                'id',
                widget.post?.id,
              ),
            ),
          )
              .then((result) {
            _model.requestCompleted1 = true;
            return result;
          }),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: SpinKitSquareCircle(
                    color: FlutterFlowTheme.of(context).primary,
                    size: 50.0,
                  ),
                ),
              );
            }
            List<PostsRow> containerPostsRowList = snapshot.data!;

            final containerPostsRow = containerPostsRowList.isNotEmpty
                ? containerPostsRowList.first
                : null;

            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Text(
                              'View Post',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineSmallFamily),
                                  ),
                            ),
                          ],
                        ),
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 45.0,
                                      height: 45.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            const Duration(milliseconds: 500),
                                        fadeOutDuration:
                                            const Duration(milliseconds: 500),
                                        imageUrl:
                                            'https://images.unsplash.com/photo-1518331483807-f6adb0e1ad23?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxsZWdvfGVufDB8fHx8MTczMDEyNjcyNXww&ixlib=rb-4.0.3&q=80&w=1080',
                                        fit: BoxFit.cover,
                                        memCacheWidth: 35,
                                        memCacheHeight: 35,
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              containerPostsRow?.author,
                                              'author',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily),
                                                  lineHeight: 1.2,
                                                ),
                                          ),
                                          Text(
                                            '@${valueOrDefault<String>(
                                              containerPostsRow?.authorUsername,
                                              'username',
                                            )}',
                                            style: FlutterFlowTheme.of(context)
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
                                                  lineHeight: 1.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (valueOrDefault<bool>(
                                      widget.post?.title != null &&
                                          widget.post?.title != '',
                                      true,
                                    ))
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            containerPostsRow?.title,
                                            'title',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumFamily),
                                              ),
                                        ),
                                      ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          containerPostsRow?.caption,
                                          'caption',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 8.0)),
                                ),
                                Text(
                                  '${dateTimeFormat("MMMEd", functions.convertToLocalTime(widget.post?.createdAt))} - ${dateTimeFormat("relative", functions.convertToLocalTime(widget.post?.createdAt))}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (containerPostsRow?.likes
                                            .contains(currentUserUid) ==
                                        false)
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-0.85, 0.05),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          icon: FaIcon(
                                            FontAwesomeIcons.heart,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            await actions.addIDtoArray(
                                              currentUserUid,
                                              widget.post!.id,
                                              'posts',
                                              'likes',
                                            );
                                            FFAppState().clearFeedCache();
                                          },
                                        ).animateOnActionTrigger(
                                            animationsMap[
                                                'iconButtonOnActionTriggerAnimation1']!,
                                            hasBeenTriggered:
                                                hasIconButtonTriggered1),
                                      ),
                                    if (containerPostsRow?.likes
                                            .contains(currentUserUid) ==
                                        true)
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          icon: FaIcon(
                                            FontAwesomeIcons.solidHeart,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            await actions.removeIDfromArray(
                                              currentUserUid,
                                              containerPostsRow!.id,
                                              'posts',
                                              'likes',
                                            );
                                          },
                                        ).animateOnActionTrigger(
                                            animationsMap[
                                                'iconButtonOnActionTriggerAnimation2']!,
                                            hasBeenTriggered:
                                                hasIconButtonTriggered2),
                                      ),
                                    if (containerPostsRow!.likes.isNotEmpty)
                                      Text(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            containerPostsRow.likes.length,
                                            formatType: FormatType.compact,
                                          ),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
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
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                              ].divide(const SizedBox(height: 8.0)),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Comments',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                  ),
                                ),
                                if (valueOrDefault<bool>(
                                  containerPostsRow.comments.isNotEmpty,
                                  true,
                                ))
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      '•',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                    ),
                                  ),
                                if (valueOrDefault<bool>(
                                  containerPostsRow.comments.isNotEmpty,
                                  true,
                                ))
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        formatNumber(
                                          containerPostsRow.comments.length,
                                          formatType: FormatType.compact,
                                        ),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                    ),
                                  ),
                              ].divide(const SizedBox(width: 8.0)),
                            ),
                          ),
                        ),
                        FutureBuilder<List<CommentsRow>>(
                          future: (_model.requestCompleter2 ??=
                                  Completer<List<CommentsRow>>()
                                    ..complete(CommentsTable().queryRows(
                                      queryFn: (q) => q
                                          .eq(
                                            'postID',
                                            widget.post?.id,
                                          )
                                          .order('created_at'),
                                    )))
                              .future,
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return const GrayloadingwidgetWidget();
                            }
                            List<CommentsRow> commentsCommentsRowList =
                                snapshot.data!;

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: commentsCommentsRowList.length,
                              itemBuilder: (context, commentsIndex) {
                                final commentsCommentsRow =
                                    commentsCommentsRowList[commentsIndex];
                                return Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 35.0,
                                              height: 35.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://picsum.photos/seed/46/600',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Flexible(
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        commentsCommentsRow
                                                            .authorName,
                                                        'author',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                                lineHeight: 1.2,
                                                              ),
                                                    ),
                                                    Text(
                                                      '@${valueOrDefault<String>(
                                                        commentsCommentsRow
                                                            .authorUsername,
                                                        'username',
                                                      )}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                                lineHeight: 1.0,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            if (commentsCommentsRow.authorID ==
                                                currentUserUid)
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderRadius: 8.0,
                                                    buttonSize: 40.0,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    icon: Icon(
                                                      Icons.delete_forever,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      await CommentsTable()
                                                          .delete(
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'id',
                                                          commentsCommentsRow
                                                              .id,
                                                        ),
                                                      );
                                                      await actions
                                                          .removeIDfromArray(
                                                        commentsCommentsRow.id,
                                                        containerPostsRow.id,
                                                        'posts',
                                                        'comments',
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                          ].divide(const SizedBox(width: 4.0)),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              commentsCommentsRow.comment,
                                              'comment',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeFamily,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                                ),
                                          ),
                                        ),
                                        Text(
                                          dateTimeFormat("relative",
                                              commentsCommentsRow.createdAt),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (commentsCommentsRow.likes
                                                    .contains(currentUserUid) ==
                                                false)
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -0.85, 0.05),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 8.0,
                                                  buttonSize: 40.0,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.heart,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    await actions.addIDtoArray(
                                                      currentUserUid,
                                                      commentsCommentsRow.id,
                                                      'comments',
                                                      'likes',
                                                    );
                                                  },
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'iconButtonOnActionTriggerAnimation3']!,
                                                    hasBeenTriggered:
                                                        hasIconButtonTriggered3),
                                              ),
                                            if (commentsCommentsRow.likes
                                                    .contains(currentUserUid) ==
                                                true)
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 8.0,
                                                  buttonSize: 40.0,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.solidHeart,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    await actions
                                                        .removeIDfromArray(
                                                      currentUserUid,
                                                      commentsCommentsRow.id,
                                                      'comments',
                                                      'likes',
                                                    );
                                                  },
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'iconButtonOnActionTriggerAnimation4']!,
                                                    hasBeenTriggered:
                                                        hasIconButtonTriggered4),
                                              ),
                                            if (valueOrDefault<bool>(
                                              commentsCommentsRow.likes.isNotEmpty,
                                              true,
                                            ))
                                              Text(
                                                formatNumber(
                                                  commentsCommentsRow
                                                      .likes.length,
                                                  formatType:
                                                      FormatType.compact,
                                                ),
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
                                          ],
                                        ),
                                      ].divide(const SizedBox(height: 8.0)),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 2.0,
                          sigmaY: 2.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: SizedBox(
                                    width: 200.0,
                                    child: TextFormField(
                                      controller: _model.commentTextController,
                                      focusNode: _model.commentFocusNode,
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
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                        hintText: 'TextField',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
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
                                      maxLines: 5,
                                      minLines: 1,
                                      maxLength: 300,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      validator: _model
                                          .commentTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  _model.sentComment =
                                      await CommentsTable().insert({
                                    'created_at': supaSerialize<DateTime>(
                                        functions
                                            .convertToUTC(getCurrentTimestamp)),
                                    'postID': widget.post?.id,
                                    'authorID': currentUserUid,
                                    'authorName':
                                        '${FFAppState().currentUser.firstName} ${FFAppState().currentUser.lastName}',
                                    'authorUsername':
                                        FFAppState().currentUser.username,
                                    'comment':
                                        _model.commentTextController.text,
                                    'likes': [],
                                  });
                                  _model.sentCommentID = _model.sentComment!.id;
                                  safeSetState(() {});
                                  await actions.addIDtoArray(
                                    _model.sentCommentID,
                                    containerPostsRow.id,
                                    'posts',
                                    'comments',
                                  );
                                  safeSetState(() {
                                    _model.commentTextController?.clear();
                                  });

                                  safeSetState(() {});
                                },
                                text: 'Comment',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
