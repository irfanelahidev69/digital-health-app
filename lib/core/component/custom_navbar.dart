import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';


import '../utilities/colors.dart';

class CustomNavBarWidget extends StatelessWidget {
  final int? selectedIndex;
  final List<PersistentBottomNavBarItem>? items;
  final ValueChanged<int>? onItemSelected;

  const CustomNavBarWidget({
    super.key,
    this.selectedIndex,
    @required this.items,
    this.onItemSelected,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: item.icon,
          ),
          const SizedBox(
            height: 2,
          ),
          FittedBox(
            child: Text(
              item.title!,
              style: TextStyle(
                color: isSelected ? AppColors.kOrangeColor : AppColors.kTextGreyColor,
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items!.map((item) {
            int index = items!.indexOf(item);
            return Container(
              width: 24,
              height: 5,
              decoration: BoxDecoration(
                color: selectedIndex == index ? AppColors.kOrangeColor : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(style: BorderStyle.solid, color: selectedIndex == index ? AppColors.kOrangeColor : Colors.white),
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 4,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items!.map((item) {
                int index = items!.indexOf(item);
                return GestureDetector(
                  onTap: () {
                    onItemSelected!(index);
                  },
                  child: _buildItem(item, selectedIndex == index),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
