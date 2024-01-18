import 'package:anidopt/ui/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'config/locator.dart';
import 'config/router/app_router.dart';
import 'firebase/firebase_options.dart';

Future<void >initiateFirebase() async{
  /** initialisasi firebase */
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await setUpLocator();
  await initiateFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Anidopt',
      /**
       * Settings Route
       */
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      /**
       * Settings Theme
       */
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}

