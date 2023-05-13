import 'package:flutter/material.dart';

import 'package:giga_chat/consts/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavBarItemBuilder {
  static PersistentBottomNavBarItem build({
    required String title,
    required Widget icon,
    Color activeColorPrimary = pink,
    Color inactiveColorPrimary = grey,
    Widget? inactiveIcon,
  }) {
    return PersistentBottomNavBarItem(
      icon: icon,
      title: title,
      activeColorPrimary: activeColorPrimary,
      inactiveColorPrimary: inactiveColorPrimary,
      inactiveIcon: inactiveIcon ?? icon,
    );
  }
}
