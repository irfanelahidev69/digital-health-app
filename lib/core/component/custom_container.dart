


import 'package:flutter/material.dart';

import '../utilities/colors.dart';


class CustomContainer extends StatelessWidget {
  final List<Widget> children;
  const CustomContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.kOrangeColor.withOpacity(0.05),
        border: Border.all(color: AppColors.kOrangeColor, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
