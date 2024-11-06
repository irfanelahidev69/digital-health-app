import 'package:digital_health_app/core/component/app_custom_buttons.dart';
import 'package:digital_health_app/core/extensions/context.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const CustomListTile({
    super.key,
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: isBold ? FontWeight.w700 : FontWeight.w500, fontSize: 16),
          ),
          SizedBox(
            width: context.width * 0.4,
            child: Text((value.isNotEmpty) ? value : "-", maxLines: 4,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: isBold ? FontWeight.w700 : FontWeight.w400, fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
