


import 'package:zoftcare_machine_test/utils/debug_utils.dart';

import '../../common/constants/constants.dart';
import '../../util.dart';
import '../../utils/navigation_utils.dart';
import '../../utils/snackbar_utils.dart' as util;

class AppError {
  final AppErrorType appErrorType;
  AppError(this.appErrorType);

   handleError() {
     util.showMessage(errorMessage());
     if(errorMessage() == networkError){

      NavigationUtils.noInternetNavigation();

     }

  }

  String errorMessage() {
    switch (appErrorType) {
      case AppErrorType.api:
        return apiError;
      case AppErrorType.network:
        return networkError;
      case AppErrorType.database:
        return databaseError;
      case AppErrorType.unauthorised:
        return unauthorisedError;
      case AppErrorType.sessionDenied:
        return sessionDeniedError;
      case AppErrorType.unexpected:
        return sessionDeniedError;
    }
  }
}

enum AppErrorType { api, network, database, unauthorised, sessionDenied, unexpected }
