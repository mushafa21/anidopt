// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FeedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FeedScreen(),
      );
    },
    HomeNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeNavigationScreen(),
      );
    },
    InformationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InformationScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(key: args.key),
      );
    },
    MapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MapScreen(),
      );
    },
    OtpVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<OtpVerificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OtpVerificationScreen(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    RegisterFormRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterFormRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterFormScreen(
          key: args.key,
          uid: args.uid,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [FeedScreen]
class FeedRoute extends PageRouteInfo<void> {
  const FeedRoute({List<PageRouteInfo>? children})
      : super(
          FeedRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeedRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeNavigationScreen]
class HomeNavigationRoute extends PageRouteInfo<void> {
  const HomeNavigationRoute({List<PageRouteInfo>? children})
      : super(
          HomeNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InformationScreen]
class InformationRoute extends PageRouteInfo<void> {
  const InformationRoute({List<PageRouteInfo>? children})
      : super(
          InformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'InformationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MapScreen]
class MapRoute extends PageRouteInfo<void> {
  const MapRoute({List<PageRouteInfo>? children})
      : super(
          MapRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OtpVerificationScreen]
class OtpVerificationRoute extends PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    Key? key,
    required String phoneNumber,
    List<PageRouteInfo>? children,
  }) : super(
          OtpVerificationRoute.name,
          args: OtpVerificationRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpVerificationRoute';

  static const PageInfo<OtpVerificationRouteArgs> page =
      PageInfo<OtpVerificationRouteArgs>(name);
}

class OtpVerificationRouteArgs {
  const OtpVerificationRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpVerificationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterFormScreen]
class RegisterFormRoute extends PageRouteInfo<RegisterFormRouteArgs> {
  RegisterFormRoute({
    Key? key,
    required String uid,
    required String phoneNumber,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterFormRoute.name,
          args: RegisterFormRouteArgs(
            key: key,
            uid: uid,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterFormRoute';

  static const PageInfo<RegisterFormRouteArgs> page =
      PageInfo<RegisterFormRouteArgs>(name);
}

class RegisterFormRouteArgs {
  const RegisterFormRouteArgs({
    this.key,
    required this.uid,
    required this.phoneNumber,
  });

  final Key? key;

  final String uid;

  final String phoneNumber;

  @override
  String toString() {
    return 'RegisterFormRouteArgs{key: $key, uid: $uid, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<RegisterRouteArgs> page =
      PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}
