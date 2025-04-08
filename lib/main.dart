import 'package:flutter/material.dart';
import 'package:yemenhistory/core/database/cache/cache_helper.dart';
import 'package:yemenhistory/core/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the cache helper before running the app
  await CacheHelper().init();
  runApp(const YemenHistory());
}

class YemenHistory extends StatelessWidget {
  const YemenHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(debugShowCheckedModeBanner: false, routerConfig: router);
  }
}
