import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


extension ContextExtension on BuildContext {
  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;

  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;

  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;

  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;

  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;

  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;

  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;

  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;

  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium!;

  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  void showAppDialog(Widget child) => showDialog(context: this, builder: (BuildContext context) => child);


  void showBottomSheet({required Widget child}) {
    showModalBottomSheet(
      context: this,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return child;
      },
    );
  }

  Future<dynamic> pushAndRemoveUntil(Widget screen) {
    return Navigator.pushAndRemoveUntil(
        this,
        CupertinoPageRoute(
          builder: (_) => screen,
        ),
            (Route route) => false);
  }

  Future<dynamic> pushReplacement(Widget screen) {
    return Navigator.pushReplacement(
      this,
      CupertinoPageRoute(
        builder: (_) => screen,
      ),
    );
  }

  Future<dynamic> push(Widget screen) {
    return Navigator.push(
      this,
      CupertinoPageRoute(
        builder: (_) => screen,
      ),
    );
  }
}
