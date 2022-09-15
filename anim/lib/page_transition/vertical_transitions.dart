import 'package:flutter/material.dart';

class BottomToUp extends PageRoute {
  final Widget targetChild;
  BottomToUp(this.targetChild);

  @override
  Color? get barrierColor => Colors.transparent;
  //  Colors.black;

  @override
  String? get barrierLabel => "";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return targetChild;
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 600);

  @override
  Duration get reverseTransitionDuration => Duration(milliseconds: 400);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    /// Between's short form = tween

    final topToBottomtween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
    final botttomToTopTween = Tween(begin: Offset(0, 1), end: Offset(0, 0));

    final rightToLeftTween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
    final leftToRightTween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
    return SlideTransition(
      position:
          animation.drive(leftToRightTween), // (0,1), (0,0.999), ... (0,0)
      // opacity: animation.drive(fadeTween),

      child: targetChild,
    );
  }
}

Route fadeRoute(Widget targetchild) {
  return PageRouteBuilder(
      pageBuilder: (ctx, _, __) => targetchild,
      transitionDuration: Duration(milliseconds: 600),
      reverseTransitionDuration: Duration(milliseconds: 600),
      barrierColor: Colors.transparent,
      transitionsBuilder: (ctx, animation, _, ch) {
        final fadeTween = Tween(begin: 0.0, end: 1.0);

        return FadeTransition(
          opacity: animation.drive(fadeTween),
          child: targetchild,
        );
      });
}

Route scaleRoute(Widget targetchild) {
  return PageRouteBuilder(
      pageBuilder: (ctx, _, __) => targetchild,
      transitionDuration: Duration(milliseconds: 600),
      reverseTransitionDuration: Duration(milliseconds: 600),
      barrierColor: Colors.transparent,
      transitionsBuilder: (ctx, animation, _, ch) {
        final scaleTween = Tween(begin: 0.0, end: 1.0);

        return ScaleTransition(
          scale: animation.drive(scaleTween),
          child: targetchild,
        );
      });
}
/// ScaleTransition
/// FadeTransition
/// SlideTransition