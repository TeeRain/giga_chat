import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

import 'package:giga_chat/consts/assets.dart';
import 'package:giga_chat/ui/bottom_nav_bar_item_builder.dart';
import 'package:giga_chat/ui/chat_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const ChatPage(),
      Container(),
      Container(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      BottomNavBarItemBuilder.build(
        title: AppLocalizations.of(context)!.chat,
        icon: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: SvgPicture.asset(chatActive)),
        inactiveIcon: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: SvgPicture.asset(chatInactive)),
      ),
      BottomNavBarItemBuilder.build(
        title: AppLocalizations.of(context)!.notifications,
        icon: const Icon(
          Icons.notifications_outlined,
        ),
      ),
      BottomNavBarItemBuilder.build(
        title: AppLocalizations.of(context)!.more,
        icon: SvgPicture.asset(moreActive),
        inactiveIcon: SvgPicture.asset(moreInactive),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      padding: const NavBarPadding.all(0),
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3,
      navBarHeight: 64,
    );
  }
}
