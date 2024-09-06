import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Server500ErrorScreen extends StatefulWidget {
  static const String routeName = "/server500_error_screen";

  const Server500ErrorScreen({super.key});

  @override
  Server500ErrorScreenState createState() => Server500ErrorScreenState();
}

class Server500ErrorScreenState extends State<Server500ErrorScreen> {




  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        // backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: ScreenUtil().setWidth(390),
                  height: ScreenUtil().setHeight(290),
                  child:
                  Lottie.asset("assets/animation/error.json",fit: BoxFit.fill)),
              SizedBox(height: ScreenUtil().setHeight(40),),
              Text("          Server error!\nPlease try again later",style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: ScreenUtil().setHeight(80),),
              TextButton(
                style: ButtonStyle(
                  padding:MaterialStateProperty.all( EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(50),
                      vertical: ScreenUtil().setHeight(10)
                  ),),
                  elevation:MaterialStateProperty.all(4),
                  // ignore: deprecated_member_use
                  backgroundColor:MaterialStateProperty.all( Colors.red,),
                  shape:MaterialStateProperty.all( RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60)
                  ),),
                ),

                onPressed: (){
                  if (Platform.isAndroid) {
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    });
                  } else if (Platform.isIOS) {
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      exit(0);
                    });
                  }
                },

                child: Text("Close",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
