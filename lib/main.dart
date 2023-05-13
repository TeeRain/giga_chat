import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  final _controller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      const MyHomePage(),
      Container(),
      Container(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: SvgPicture.asset('assets/images/chat_active.svg')),
        title: ("Chat"),
        activeColorPrimary:  const Color(0xffAF006E),
        inactiveColorPrimary: const Color(0xff0A2A3F),
        
        inactiveIcon: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: SvgPicture.asset('assets/images/chat_inactive.svg')),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.notifications_outlined,
        ),
        title: ("Notifications"),
        activeColorPrimary: const  Color(0xffAF006E),
        inactiveColorPrimary: const Color(0xff0A2A3F),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/images/more_active.svg'),
        title: ("More"),
        activeColorPrimary: const   Color(0xffAF006E),
        inactiveColorPrimary: const Color(0xff0A2A3F),
        inactiveIcon: SvgPicture.asset('assets/images/more_inactive.svg'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      padding: const NavBarPadding.all(0),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0A2A3F),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            const CircleAvatar(radius: 16,),
            const Text('Chat'),
            SvgPicture.asset('assets/images/chat_add.svg')
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Colors.black)),
                    width: sWidth * 0.72,
                    height: 48,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search...',
                        prefixIcon: Icon(Icons.search_outlined),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 48,
                  width: 56,
                  padding: const EdgeInsets.all(8),
                  decoration:
                      BoxDecoration( borderRadius:
                            const BorderRadius.all(Radius.circular(8)),border: Border.all(color: const Color(0xffAF006E))),
                  child: SvgPicture.asset('assets/images/filter.svg'),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      width: sWidth,
                      height: sHeight * 0.12,
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 24,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Giga',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 6.0),
                                  child: Text('Chat'),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Align(
                              alignment: Alignment.topRight,
                              child: Text('Wczoraj',style: TextStyle(color: Color(0xff2c5d7e)),))
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                );
              },
              itemCount: 5,
            ),
          ),
        ]),
      ),
    );
  }
}
