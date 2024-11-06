import 'package:digital_health_app/core/extensions/context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String? title;
  final String content;
  final String? description;
  final String? icon;
  final double? height;
  final List<CupertinoDialogAction>? actions;

  const CustomDialog({super.key, this.height, this.title, this.actions, this.description, required this.content, this.icon});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            (icon != null)
                ? Container(
                    height: height ?? 80,
                    width: 110,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          icon!,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            (icon != null)
                ? const SizedBox(
                    height: 20,
                  )
                : const SizedBox(),
            Text(
              content,
              style: context.titleMedium.copyWith(fontWeight: FontWeight.w700),
            ),
            (description != null)
                ? Text(
                    description!,
                  )
                : const SizedBox(),
          ],
        ),
      ),
      actions: actions ?? [],
    );
  }
}
