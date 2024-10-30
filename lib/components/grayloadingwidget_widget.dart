import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'grayloadingwidget_model.dart';
export 'grayloadingwidget_model.dart';

class GrayloadingwidgetWidget extends StatefulWidget {
  const GrayloadingwidgetWidget({super.key});

  @override
  State<GrayloadingwidgetWidget> createState() =>
      _GrayloadingwidgetWidgetState();
}

class _GrayloadingwidgetWidgetState extends State<GrayloadingwidgetWidget>
    with TickerProviderStateMixin {
  late GrayloadingwidgetModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GrayloadingwidgetModel());

    animationsMap.addAll({
      'cardOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0xE8F4F4FF),
            angle: 0.524,
          ),
        ],
      ),
      'cardOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0xE8F4F4FF),
            angle: 0.524,
          ),
        ],
      ),
      'cardOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0xE8F4F4FF),
            angle: 0.524,
          ),
        ],
      ),
      'cardOnPageLoadAnimation4': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0xE8F4F4FF),
            angle: 0.524,
          ),
        ],
      ),
      'cardOnPageLoadAnimation5': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0xE8F4F4FF),
            angle: 0.524,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: const Color(0xCDF1F4F8),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 150.0,
              decoration: const BoxDecoration(),
            ),
          ),
        ).animateOnPageLoad(animationsMap['cardOnPageLoadAnimation1']!),
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: const Color(0xCDF1F4F8),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 150.0,
              decoration: const BoxDecoration(),
            ),
          ),
        ).animateOnPageLoad(animationsMap['cardOnPageLoadAnimation2']!),
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: const Color(0xCDF1F4F8),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 150.0,
              decoration: const BoxDecoration(),
            ),
          ),
        ).animateOnPageLoad(animationsMap['cardOnPageLoadAnimation3']!),
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: const Color(0xCDF1F4F8),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 150.0,
              decoration: const BoxDecoration(),
            ),
          ),
        ).animateOnPageLoad(animationsMap['cardOnPageLoadAnimation4']!),
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: const Color(0xCDF1F4F8),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 150.0,
              decoration: const BoxDecoration(),
            ),
          ),
        ).animateOnPageLoad(animationsMap['cardOnPageLoadAnimation5']!),
      ].divide(const SizedBox(height: 8.0)),
    );
  }
}
