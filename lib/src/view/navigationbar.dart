import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:handey_app/src/view/home_stf.dart';
import 'package:handey_app/src/view/utils/custom_appbar.dart';
import 'package:handey_app/src/view/utils/custom_drawer.dart';
import 'package:handey_app/src/view/utils/screen_size.dart';
import 'package:handey_app/src/view/weekly_memo_screen.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  ScreenSize size;
  int _pageIndex = 0;

  var childList = [
    HomeStateful(),
    WeeklyMemoScreen()
  ];

  @override
  Widget build(BuildContext context) {
    size = ScreenSize();
    return Scaffold(
        appBar: CustomAppBar(),
        endDrawer: CustomDrawer(),
        body: childList[_pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _pageIndex,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xFF404040),
          selectedFontSize: size.getSize(12),
          unselectedFontSize: size.getSize(12),
          showUnselectedLabels: true,
          onTap: (newIndex) {
            setState(() {
              _pageIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: _pageIndex == 0 ? Icon(Icons.home) : Icon(Icons.home_outlined),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: _pageIndex == 1 ? Icon(Icons.account_balance_wallet) : Icon(Icons.account_balance_wallet_outlined),
                label: 'Weekly/Memo'),
          ],
        )
    );
  }
}
