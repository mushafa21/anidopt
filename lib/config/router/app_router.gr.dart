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
    ChatRoomRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRoomRouteArgs>(
          orElse: () => const ChatRoomRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChatRoomScreen(key: args.key),
      );
    },
    ChatRoute.name: (routeData) {
      final args =
          routeData.argsAs<ChatRouteArgs>(orElse: () => const ChatRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChatScreen(key: args.key),
      );
    },
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
    CreateReportRoute.name: (routeData) {
      final args = routeData.argsAs<CreateReportRouteArgs>(
          orElse: () => const CreateReportRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateReportScreen(key: args.key),
      );
    },
    FeedRoute.name: (routeData) {
      final args =
          routeData.argsAs<FeedRouteArgs>(orElse: () => const FeedRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FeedScreen(key: args.key),
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
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileScreen(key: args.key),
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
    ReportListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReportListScreen(),
      );
    },
    SelectNewOwnerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectNewOwnerScreen(),
      );
    },
    UserTermsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserTermsScreen(),
      );
    },
    UserVerificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserVerificationScreen(),
      );
    },
  };
}

/// generated route for
/// [ChatRoomScreen]
class ChatRoomRoute extends PageRouteInfo<ChatRoomRouteArgs> {
  ChatRoomRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ChatRoomRoute.name,
          args: ChatRoomRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChatRoomRoute';

  static const PageInfo<ChatRoomRouteArgs> page =
      PageInfo<ChatRoomRouteArgs>(name);
}

class ChatRoomRouteArgs {
  const ChatRoomRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ChatRoomRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ChatScreen]
class ChatRoute extends PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const PageInfo<ChatRouteArgs> page = PageInfo<ChatRouteArgs>(name);
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key}';
  }
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
/// [CreateReportScreen]
class CreateReportRoute extends PageRouteInfo<CreateReportRouteArgs> {
  CreateReportRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CreateReportRoute.name,
          args: CreateReportRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreateReportRoute';

  static const PageInfo<CreateReportRouteArgs> page =
      PageInfo<CreateReportRouteArgs>(name);
}

class CreateReportRouteArgs {
  const CreateReportRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CreateReportRouteArgs{key: $key}';
  }
}

/// generated route for
/// [FeedScreen]
class FeedRoute extends PageRouteInfo<FeedRouteArgs> {
  FeedRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FeedRoute.name,
          args: FeedRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'FeedRoute';

  static const PageInfo<FeedRouteArgs> page = PageInfo<FeedRouteArgs>(name);
}

class FeedRouteArgs {
  const FeedRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'FeedRouteArgs{key: $key}';
  }
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
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<ProfileRouteArgs> page =
      PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key}';
  }
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

/// generated route for
/// [ReportListScreen]
class ReportListRoute extends PageRouteInfo<void> {
  const ReportListRoute({List<PageRouteInfo>? children})
      : super(
          ReportListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectNewOwnerScreen]
class SelectNewOwnerRoute extends PageRouteInfo<void> {
  const SelectNewOwnerRoute({List<PageRouteInfo>? children})
      : super(
          SelectNewOwnerRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectNewOwnerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserTermsScreen]
class UserTermsRoute extends PageRouteInfo<void> {
  const UserTermsRoute({List<PageRouteInfo>? children})
      : super(
          UserTermsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserTermsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserVerificationScreen]
class UserVerificationRoute extends PageRouteInfo<void> {
  const UserVerificationRoute({List<PageRouteInfo>? children})
      : super(
          UserVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserVerificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
