

import 'package:anidopt/config/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

import '../../cache_store.dart';
import '../../locator.dart';

class InitialRouteGuards extends AutoRouteGuard{
  final CacheStore _cacheStore = locator<CacheStore>();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (kDebugMode) {
      print("OnBoardingGuards token ${_cacheStore.token}");
    }
    resolver.next(true);
    if (_cacheStore.isLogin) {
      router.push(HomeNavigationRoute());
    } else if(!_cacheStore.first){
      router.push(LoginRoute());
    } else{
      resolver.next(true);

    }
  }

}
