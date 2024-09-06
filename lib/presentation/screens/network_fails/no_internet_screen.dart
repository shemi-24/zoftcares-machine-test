import 'dart:io';



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';

import '../../../common/constants/color_constants.dart';
import '../../../data/core/api_constants.dart';
import '../../../utils/debug_utils.dart';
import '../../route/route_constants.dart';

class NoInternetScreen extends StatefulWidget {
  static const String routeName = "/no_internet_screen";

  const NoInternetScreen({super.key});

  @override
  NoInternetScreenState createState() => NoInternetScreenState();
}

class NoInternetScreenState extends State<NoInternetScreen> {

  final GlobalKey<LiquidPullToRefreshState> refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();

  Future<void> _onRefresh() async {

    try {
      final result = await InternetAddress.lookup(ApiConstants.domainName);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        consoleLog('network connected');
        if(mounted) Navigator.of(context).pushNamed(RouteList.splash);
      }

    } on SocketException catch (_) {
      consoleLog('not connected');
    }
  }

  @override
  Widget build(BuildContext context) {


    
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Theme.of(context).primaryColor,
        body: LiquidPullToRefresh(
          onRefresh: _onRefresh,
          key: refreshIndicatorKey,
          child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              // physics: NeverScrollableScrollPhysics(),
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 250.h,),
                    SizedBox(
                        width: 313.w,
                        height: 200.h,
                        child:
                        Lottie.asset("assets/animation/no_internet.json")),
                    SizedBox(height: 10.h,),
                    Text("No Internet Connection",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20.h,),
                    InkResponse(
                      onTap: _onRefresh,
                      child: Container(
                        width: 120.w,
                        // height: 65.h,
                        constraints: BoxConstraints(
                          minHeight: 65.h,
                          maxHeight: 75.h,
                        ),
                        decoration: BoxDecoration(
                            color: blueShade1,
                            borderRadius: BorderRadius.circular(18)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Refresh",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Colors.white),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500)),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
