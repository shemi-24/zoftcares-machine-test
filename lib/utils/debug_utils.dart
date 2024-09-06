import 'package:flutter/foundation.dart';

consoleLog(var data) {
  if (!kReleaseMode) {
    // ignore: avoid_print
    print(data);
  }
}
