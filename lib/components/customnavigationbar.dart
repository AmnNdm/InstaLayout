import 'package:flutter/material.dart';
import 'package:insta_layout/components/constants.dart';
import 'package:insta_layout/views/activity/activity.dart';
import 'package:insta_layout/views/camera/gallerypostview.dart';
import 'package:insta_layout/views/home/home.dart';
import 'package:insta_layout/views/search/search.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'customwidgets.dart';
import '../views/profile/profile.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<CustomBottomBar> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);
  bool hideStatus = false;

  List<PersistentBottomNavBarItem> items(Color color) {
    return [
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(
          Icons.home_outlined,
        ),
        icon: const Icon(
          Icons.home_sharp,
        ),
        activeColorPrimary: color,
        inactiveColorPrimary: color,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.search,
          size: 28.h,
        ),
        inactiveIcon: const Icon(
          Icons.search_outlined,
        ),
        activeColorPrimary: color,
        inactiveColorPrimary: color,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.add_box_outlined,
        ),
        activeColorPrimary: color,
        inactiveColorPrimary: color,
        onPressed: (p0) {
          pushNewScreen(context,
              screen: PostScreen(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.slideRight);
        },
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.favorite,
        ),
        inactiveIcon: const Icon(
          Icons.favorite_border,
        ),
        activeColorPrimary: color,
        inactiveColorPrimary: color,
      ),
      PersistentBottomNavBarItem(
        icon: userIcon(color: color),
        inactiveIcon: userIcon(color: isnotDarkMode()),
        activeColorPrimary: color,
        inactiveColorPrimary: color,
      )
    ];
  }

  final List<Widget> screens = [
    const MyHomePage(),
    const SearchScreen(),
    PostScreen(),
    const ActivityScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      items: items(isDarkMode()),
      backgroundColor:
          ((MediaQuery.of(context).platformBrightness == Brightness.dark))
              ? Colors.black
              : Colors.white,
      screens: screens,
      controller: controller,
      confineInSafeArea: true,
      stateManagement: true,
      handleAndroidBackButtonPress: true,
      navBarStyle: NavBarStyle.style12,
    );
  }

  Widget userIcon({required Color color}) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 13.r,
      child: profileImage(12, Constants.user0),
    );
  }
}
