import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'cache_store.dart';




/// Global [GetIt.instance].
final GetIt locator = GetIt.instance;

/// Set up [GetIt] locator.
Future<void> setUpLocator() async {

  locator.registerSingleton<CacheStore>(CacheStore());



}
