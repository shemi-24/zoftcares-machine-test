import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:zoftcare_machine_test/utils/debug_utils.dart';
import 'package:zoftcare_machine_test/values.dart' as values;

import 'data/core/api_constants.dart';

void showSuccess(BuildContext context, String message) {
  showTopSnackBar(Overlay.of(context), CustomSnackBar.success(message: message),displayDuration: const Duration(seconds: 3));
}

void showError(BuildContext context, String message) {
  showTopSnackBar(Overlay.of(context), CustomSnackBar.error(message: message),displayDuration: const Duration(seconds: 3));
}

void showInfo(BuildContext context, String message) {
  showTopSnackBar(Overlay.of(context), CustomSnackBar.info(message: message),displayDuration: const Duration(seconds: 3));
}

void showLoader(){
  EasyLoading.show(
    //status: 'Processing...',
    maskType: EasyLoadingMaskType.black,
  );
}

void hideLoader(){
  EasyLoading.dismiss();
}

bool isLoaderShowing(){
  return EasyLoading.isShow;
}

String _authToken="";


 GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); // Create a key

GlobalKey<ScaffoldState> scaffoldKey1 = GlobalKey<ScaffoldState>(); // Create a key


bool isAuthTokenValid(){
  if(_authToken!="") {
    return true;
  } else {
    return false;
  }
}

String getAuthToken(){
  return _authToken;
}

void fetchAuthToken() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var value = prefs.getString(values.AUTH_TOKEN);
  if(value!=null) _authToken = value;
  if (kDebugMode) {
    print("AUTH TOKEN:$_authToken");
  }
}

void setAuthToken(String value) async{
  _authToken = value;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(values.AUTH_TOKEN, value).then((status){
    if(status){
      if (kDebugMode) {
        print("AUTH TOKEN SET");
      }
      _authToken = value;
      if (kDebugMode) {
        print(_authToken);
      }

    }
  }) ;
}

String formatCustomDate(DateTime date) {


  final weekdayFormat = DateFormat.E('en_US');
  final monthDayFormat = DateFormat('dd');
  final monthFormat = DateFormat.MMM('en_US');
  final yearFormat = DateFormat.y('en_US');

  final weekday = weekdayFormat.format(date);
  final monthDay = monthDayFormat.format(date);
  final month = monthFormat.format(date);
  final year = yearFormat.format(date);
  final time = DateFormat.jm().format(date);


  return '$weekday $monthDay - $month $year , $time';
  // return '$weekday $monthDay - $month $year';
}


String statusExpander(String? statusAbbrevator){
  if(statusAbbrevator == "A"){
    return "Active";
  }
  else if(statusAbbrevator == "I"){
    return "InActive";
  }
  else if(statusAbbrevator == "P"){
    return "Pending";
  }
  else if(statusAbbrevator == "S"){
    return "Suspended";
  }
  else if(statusAbbrevator == "C"){
    return "Completed";
  }
  else{
    return "No Status";
  }
}

String convertTimestamp(DateTime timestamp) {
  // Parse the provided timestamp
  // DateTime timestamp = DateTime.parse(timestampString);

  // Format the time in the desired format
  // String formattedTime = DateFormat('hh:mm:ss a').format(timestamp);

  // Format the date in the desired format
  String formattedDate = DateFormat('dd-MM-yyyy').format(timestamp);

  // Combine the formatted time and date
  // String result = '$formattedTime, $formattedDate';
  String result = formattedDate;

  return result;
}


void logoutFromAccount() async{

  // var provider = Provider.of<AuthProvider>(NavigationService.navigationKey.currentContext!,listen: false);


  SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();

  sharedPreferences.setString(values.AUTH_TOKEN,"");
  consoleLog("Logout");
  // Navigator.of(NavigationService.navigationKey.currentContext!).pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
  // provider.resetUser();
}



List<String> convertDynamicToList (dynamic data){
  List<String> stringList = [];
  if (data is List) {
    stringList = List<String>.from(data);
    return stringList;
  }
  else{
    return [];
  }
}



void showMessage({required String title,required String message,required ContentType contentType}){
  final snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message:
      message,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: contentType,
    ),
  );

  ScaffoldMessenger.of(NavigationService.navigationKey.currentContext!)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}



Future<bool> isNetWorkAvailable() async{
  try {
    final result = await InternetAddress.lookup(ApiConstants.domainName);
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      consoleLog('network connected');
      return true;
    }
    else{
      return false;
    }
  } on SocketException catch (_) {
    consoleLog("network not connected");
    return false;
  }
}






