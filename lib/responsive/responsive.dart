import 'dart:developer';

import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget laptop;
  final Widget? desktop;

  const Responsive(
      {super.key,
      required this.mobile,
      this.tablet,
      required this.laptop,
      this.desktop});

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 599;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 600 &&
      MediaQuery.of(context).size.width <= 905;

  static bool isLaptop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1240 &&
      MediaQuery.of(context).size.width < 1439;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1440;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    log('size: $size.width');
    if (size.width >= 1439) {
      return desktop!;
    }
    // If our width is more than 1100 then we consider it a laptop
    if (size.width >= 1240 && size.width < 1439) {
      return laptop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (size.width >= 800 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
