import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../model/post_model.dart';
import '../../presentation/home/feed/feed_screen.dart';
import '../../presentation/home/home_navigation_screen.dart';
import '../../presentation/home/information/information_screen.dart';
import '../../presentation/home/map/map_screen.dart';
import '../../presentation/home/profile/profile_screen.dart';
import '../../presentation/login/login_screen.dart';
import '../../presentation/onboarding/onboarding_screen.dart';
import '../../presentation/otp_verification/otp_verification_screen.dart';
import '../../presentation/post/create_post/create_post_screen.dart';
import '../../presentation/post/post_detail/post_detail_screen.dart';
import '../../presentation/register/register_form/register_form_screen.dart';
import '../../presentation/register/register_screen.dart';
import '../enum/post_type.dart';
import 'guards/initiate_route_guards.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: OnboardingRoute.page,
            initial: true,
            guards: [InitialRouteGuards()]),
        AutoRoute(
          page: LoginRoute.page,
        ),
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
          AutoRoute(page: FeedRoute.page, initial: true),
          AutoRoute(
            page: MapRoute.page,
          ),
          AutoRoute(
            page: InformationRoute.page,
          ),
          AutoRoute(
            page: ProfileRoute.page,
          ),
        ]),
        AutoRoute(
          page: CreatePostRoute.page,
        ),
        AutoRoute(
          page: PostDetailRoute.page,
        ),
      ];
}

final appRouter = AppRouter();
