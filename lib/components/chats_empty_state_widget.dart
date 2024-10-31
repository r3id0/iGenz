import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'chats_empty_state_model.dart';
export 'chats_empty_state_model.dart';

class ChatsEmptyStateWidget extends StatefulWidget {
  const ChatsEmptyStateWidget({super.key});

  @override
  State<ChatsEmptyStateWidget> createState() => _ChatsEmptyStateWidgetState();
}

class _ChatsEmptyStateWidgetState extends State<ChatsEmptyStateWidget> {
  late ChatsEmptyStateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatsEmptyStateModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.1,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          image: DecorationImage(
            fit: BoxFit.contain,
            image: Image.asset(
              'assets/images/heading0.png',
            ).image,
          ),
        ),
      ),
    );
  }
}
