import 'package:flutter/material.dart';
import 'package:yemenhistory/core/routes/app_routes.dart';

class YemenHistory extends StatelessWidget {
  const YemenHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(debugShowCheckedModeBanner: false, routerConfig: router);
  }
}
