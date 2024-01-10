

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

    // if (_cacheStore.token.isNotEmpty && _cacheStore.user.pin != null) {
    //   router.push(LoginPinRoute());
    //
    // } else if(_cacheStore.token.isNotEmpty && _cacheStore.user.pin == null) {
    //   router.push(CreatePinRoute());
    // } else if(!_cacheStore.first){
    //   router.push(LoginRoute());
    // } else{
    //   resolver.next(true);
    //
    // }
  }

}
