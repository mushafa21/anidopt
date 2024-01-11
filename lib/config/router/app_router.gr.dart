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
    CreatePostRoute.name: (routeData) {
      final args = routeData.argsAs<CreatePostRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreatePostScreen(
          key: args.key,
          postType: args.postType,
        ),
      );
    },
    FeedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FeedScreen(),
      );
    },
    HomeNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<HomeNavigationRouteArgs>(
          orElse: () => const HomeNavigationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeNavigationScreen(
          key: args.key,
          initial: args.initial,
        ),
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
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
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
    PostDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PostDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PostDetailScreen(
          key: args.key,
          postModel: args.postModel,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child:  ProfileScreen(),
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
/// [CreatePostScreen]
class CreatePostRoute extends PageRouteInfo<CreatePostRouteArgs> {
  CreatePostRoute({
    Key? key,
    required PostType postType,
    List<PageRouteInfo>? children,
  }) : super(
          CreatePostRoute.name,
          args: CreatePostRouteArgs(
            key: key,
            postType: postType,
          ),
          initialChildren: children,
        );

  static const String name = 'CreatePostRoute';

  static const PageInfo<CreatePostRouteArgs> page =
      PageInfo<CreatePostRouteArgs>(name);
}

class CreatePostRouteArgs {
  const CreatePostRouteArgs({
    this.key,
    required this.postType,
  });

  final Key? key;

  final PostType postType;

  @override
  String toString() {
    return 'CreatePostRouteArgs{key: $key, postType: $postType}';
  }
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
class HomeNavigationRoute extends PageRouteInfo<HomeNavigationRouteArgs> {
  HomeNavigationRoute({
    Key? key,
    PageRouteInfo<dynamic>? initial,
    List<PageRouteInfo>? children,
  }) : super(
          HomeNavigationRoute.name,
          args: HomeNavigationRouteArgs(
            key: key,
            initial: initial,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeNavigationRoute';

  static const PageInfo<HomeNavigationRouteArgs> page =
      PageInfo<HomeNavigationRouteArgs>(name);
}

class HomeNavigationRouteArgs {
  const HomeNavigationRouteArgs({
    this.key,
    this.initial,
  });

  final Key? key;

  final PageRouteInfo<dynamic>? initial;

  @override
  String toString() {
    return 'HomeNavigationRouteArgs{key: $key, initial: $initial}';
  }
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
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

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
/// [PostDetailScreen]
class PostDetailRoute extends PageRouteInfo<PostDetailRouteArgs> {
  PostDetailRoute({
    Key? key,
    required PostModel postModel,
    List<PageRouteInfo>? children,
  }) : super(
          PostDetailRoute.name,
          args: PostDetailRouteArgs(
            key: key,
            postModel: postModel,
          ),
          initialChildren: children,
        );

  static const String name = 'PostDetailRoute';

  static const PageInfo<PostDetailRouteArgs> page =
      PageInfo<PostDetailRouteArgs>(name);
}

class PostDetailRouteArgs {
  const PostDetailRouteArgs({
    this.key,
    required this.postModel,
  });

  final Key? key;

  final PostModel postModel;

  @override
  String toString() {
    return 'PostDetailRouteArgs{key: $key, postModel: $postModel}';
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
