import 'package:anidopt/feature/login/login_screen.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../feature/home/feed/feed_screen.dart';
import '../../feature/home/home_navigation_screen.dart';
import '../../feature/home/information/information_screen.dart';
import '../../feature/home/map/map_screen.dart';
import '../../feature/home/profile/profile_screen.dart';
import '../../feature/otp_verification/otp_verification_screen.dart';
import '../../feature/register/register_form/register_form_screen.dart';
import '../../feature/register/register_screen.dart';
import 'guards/initiate_route_guards.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: LoginRoute.page,
            initial: true,
            guards: [InitialRouteGuards()]),
        AutoRoute(
          page: RegisterRoute.page,
        ),
        AutoRoute(
          page: RegisterFormRoute.page,
        ),
        AutoRoute(
          page: OtpVerificationRoute.page,
        ),
        AutoRoute(page: HomeNavigationRoute.page, children: [
          AutoRoute(
            page: FeedRoute.page,
          ),
        ]),
      ];
}

final appRouter = AppRouter();
