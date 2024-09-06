import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ServerErrorScreen extends StatefulWidget {
  static const String routeName = "/server_error_screen";

  const ServerErrorScreen({super.key});

  @override
  ServerErrorScreenState createState() => ServerErrorScreenState();
}

class ServerErrorScreenState extends State<ServerErrorScreen> {




  @override
  Widget build(BuildContext context) {


    return Container(
      color: Colors.transparent,
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: Theme.of(context).primaryColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: ScreenUtil().setWidth(313),
                    height: ScreenUtil().setHeight(200),
                    child:
                    Lottie.asset("assets/animation/server_error.json")),
                SizedBox(height: ScreenUtil().setHeight(40),),
                Text("Server is under maintenance \n   Please try again later!!!",style: GoogleFonts.poppins(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: ScreenUtil().setHeight(80),),
                TextButton(
                  style: ButtonStyle(
                    padding:MaterialStateProperty.all( EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(50),
                        vertical: ScreenUtil().setHeight(8)
                    ),),
                    elevation:MaterialStateProperty.all(4),
                    backgroundColor:MaterialStateProperty.all( Colors.red),
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
      ),
    );
  }
}
