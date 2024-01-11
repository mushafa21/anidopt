import 'package:anidopt/config/cache_store.dart';
import 'package:anidopt/config/locator.dart';
import 'package:anidopt/config/router/app_router.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final CacheStore _cacheStore = locator.get();

  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context){
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          OutlinedButton(onPressed: (){
            _cacheStore.clearCache();
            context.router.replaceAll([LoginRoute()]);
          }, child: Text("Logout"))
        ],
      )),
    );
  }
}
