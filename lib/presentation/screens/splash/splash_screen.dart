
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zoftcare_machine_test/common/constants/constants.dart';
import 'package:zoftcare_machine_test/presentation/screens/posts/bloc/post_bloc.dart';

import '../../../common/constants/color_constants.dart';
import '../../route/route_constants.dart';
import 'bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final splashBloc = BlocProvider.of<SplashBloc>(context);
    splashBloc.add(SplashInitEvent());
  }


  @override
  Widget build(BuildContext context) {
    // final CountryCodeUseCase countryCodeUseCase = Get.find();

    final postBloc = BlocProvider.of<PostBloc>(context);

    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {

        if(state is SplashLoadedState){
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            // Future.delayed(const Duration(seconds: 3), () {
            //   Navigator.of(navigator!.context).pushReplacementNamed(RouteList.authWrapper);
            // });
            postBloc.add(PostLoadingEvent(1, 10));
          });
        }

        if (state is SplashAPILoadingError){
          SafeArea(
              top: false,
              bottom: false,
              child: Scaffold(
                backgroundColor: blueShade1,
                body: Center(
                  child: Text(state.message),
                ),
              )
          );
        }

        return SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              backgroundColor: blueShade1,
              body: Center(
                child: Image.asset(
                  "${imagePath}logo.png", width: 140, height: 140,),
              ),
            )
        );
      },
    );
  }
}
