import 'package:eazy_pay/app/pages/bills.dart';
import 'package:eazy_pay/app/pages/dashboard.dart';
import 'package:eazy_pay/app/pages/profile.dart';
import 'package:eazy_pay/core/style/color_constants.dart';
import 'package:eazy_pay/core/style/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  static const List<Widget> _screens = [
    Dashboard(),
    BillPage(),
    ProfilePage(),
  ];

  Color white = Colors.white;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        currentIndex: _currentIndex,
        backgroundColor: greyWhitish,
        selectedItemColor: primaryDarkBlue,
        unselectedItemColor: primaryTextGrey,
        iconSize: 20,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (int tappedIndex) {
          setState(() {
            HapticFeedback.lightImpact();
            _currentIndex = tappedIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.bills),
            label: 'Bills',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.user),
            label: 'Profile',
          )
        ],
      ),
      body: _screens.elementAt(_currentIndex),
    );
  }
}
