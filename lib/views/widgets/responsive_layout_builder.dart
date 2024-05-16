import 'package:flutter/material.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget mobileView;
  final Widget desktopView;
  const ResponsiveLayoutBuilder(
      {required this.mobileView, required this.desktopView, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      if (size.width < 600) {
        return mobileView;
      } else {
        return desktopView;
      }
    });
  }
}
