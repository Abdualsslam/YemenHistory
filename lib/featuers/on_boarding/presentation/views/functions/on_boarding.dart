import 'package:yemenhistory/core/database/cache/cache_helper.dart';
import 'package:yemenhistory/core/services/service_locator.dart';

void onBoardingVisited() {
  getIt<CacheHelper>().saveData(key: "isOnBoardingVisited", value: true);
}
