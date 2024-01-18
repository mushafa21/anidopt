import 'package:anidopt/config/router/app_router.dart';
import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/type.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class HomeNavigationScreen extends StatelessWidget {
  final PageRouteInfo? initial;

  const HomeNavigationScreen({super.key, this.initial});

  @override
  Widget build(BuildContext context) {
    if (initial != null) {
      context.router.push(initial!);
    }
    return AutoTabsScaffold(
      routes: [
        FeedRoute(),
        MapRoute(),
        ChatRoute(),
        InformationRoute(),
        ProfileRoute(),
      ],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          backgroundColor: primaryContainerColor,
          useLegacyColorScheme: false,
          selectedLabelStyle: sRegular,
          unselectedLabelStyle: sRegular,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          unselectedItemColor: gray6Color,
          onTap: (index) {
            tabsRouter.setActiveIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/images/ic_navigation_feed.svg",
                width: 24,
                height: 24,
                // color: primary70Color,
              ),
              icon: SvgPicture.asset(
                "assets/images/ic_navigation_feed.svg",
                width: 24,
                height: 24,
                color: gray6Color,
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/images/ic_navigation_map.svg",
                width: 24,
                height: 24,
                // color: primary70Color,
              ),
              icon: SvgPicture.asset("assets/images/ic_navigation_map.svg",
                  width: 24, height: 24,
                color: gray6Color,
              ),
              label: 'Peta',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/images/ic_navigation_chat.svg",
                width: 24,
                height: 24,
                // color: primary70Color,
              ),
              icon: SvgPicture.asset("assets/images/ic_navigation_chat.svg",
                width: 24, height: 24,
                color: gray6Color,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/images/ic_navigation_information.svg",
                width: 24,
                height: 24,
                // color: primary70Color,
              ),
              icon: SvgPicture.asset("assets/images/ic_navigation_information.svg",
                  width: 24, height: 24,
                color: gray6Color,
              ),
              label: 'Cari',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/images/ic_navigation_profile.svg",
                width: 24,
                height: 24,
                // color: primary70Color,
              ),
              icon: SvgPicture.asset("assets/images/ic_navigation_profile.svg",
                  width: 24, height: 24,
                color: gray6Color,
              ),
              label: 'Profil',
            ),
          ],
        );
      },
    );
  }
}
