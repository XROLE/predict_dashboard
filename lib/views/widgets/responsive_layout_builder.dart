import 'package:flutter/material.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget mobileView;
  final Widget desktopView;
  const ResponsiveLayoutBuilder(
      {required this.mobileView, required this.desktopView, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return mobileView;
      } else {
        return desktopView;
      }
    });
  }
}
