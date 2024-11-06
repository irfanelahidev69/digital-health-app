import 'package:digital_health_app/features/home/screen/history_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../core/component/custom_navbar.dart';
import '../../../core/utilities/colors.dart';
import '../../../core/utilities/strings.dart';
import 'check_in_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0;
  int selectedHomeIndex = 0;
  final PageController _controller = PageController();
  final PageController homePageController = PageController();

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
          color: selectIndex == 0 ? AppColors.kOrangeColor : AppColors.kTextGreyColor,
        ),
        title: (Strings.home),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.receipt,
          color: selectIndex == 1 ? AppColors.kOrangeColor : AppColors.kTextGreyColor,
        ),
        title: (Strings.history),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 80,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              color: Colors.white,
              child: CustomNavBarWidget(
                items: _navBarsItems(),
                selectedIndex: selectIndex,
                onItemSelected: (index) {
                  setState(() {
                    selectIndex = index;
                  });
                  _controller.animateToPage(selectIndex, duration: const Duration(milliseconds: 300), curve: Curves.ease);
                },
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Welcome",
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: PageView(
            onPageChanged: (value) {
              setState(() {
                selectIndex = value;
              });
            },
            controller: _controller,
            children: const [CheckInPage(), HistoryPage()],
          ),
        ),
      ),
    );
  }
}
