
import 'package:digital_health_app/core/extensions/context.dart';
import 'package:flutter/material.dart';
import '../../../core/component/custom_container.dart';
import '../../../core/component/custom_list_tile.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({
    super.key,
  });

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "History",
                style: context.titleLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: CustomContainer(
                      children:  [
                        CustomListTile(

                          labelFirst: "Item ID:",
                          valueFirst: "1331139979",
                          isBold: true,
                        ),
                        CustomListTile(

                          labelFirst: "Received Date:",
                          valueFirst: "2022-06-30, 01:00:00",

                        ),
                        CustomListTile(
                          labelFirst: "Segment:",
                          valueFirst: "Standard",
                        ),
                        CustomListTile(
                          labelFirst: "Status:",
                          valueFirst: "Order Received & Ready to Pick",
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
