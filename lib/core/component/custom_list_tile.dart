import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String labelFirst;
  final String valueFirst;
  final bool isBold;

  const CustomListTile({
    super.key,
    required this.labelFirst,
    required this.valueFirst,
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
            labelFirst,
            style: TextStyle(fontWeight: isBold ? FontWeight.w700 : FontWeight.w500, fontSize: 16),
          ),
          SizedBox(
            child: Text((valueFirst.isNotEmpty) ? valueFirst : "-", style: TextStyle(fontWeight: isBold ? FontWeight.w700 : FontWeight.w400, fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
