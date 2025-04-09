import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yemenhistory/core/database/cache/cache_helper.dart';
import 'package:yemenhistory/core/routes/app_routes.dart';
import 'package:yemenhistory/core/services/service_locator.dart';
import 'package:yemenhistory/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup the service locator
  setupServiceLocator();

  // Initialize the cache helper before running the app
  await getIt<CacheHelper>().init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const YemenHistory());
}

class YemenHistory extends StatelessWidget {
  const YemenHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(debugShowCheckedModeBanner: false, routerConfig: router);
  }
}
