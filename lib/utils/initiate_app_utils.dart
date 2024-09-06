import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../di/di.dart' as di;
import '../presentation/theme/theme.dart';

setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  //..........

  await GetStorage.init();
  await di.DependencyInjection().init();
  setSystemOverlay();
  // await setupNotification();
}
