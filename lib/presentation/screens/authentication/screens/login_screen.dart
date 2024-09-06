import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:zoftcare_machine_test/presentation/route/route_constants.dart';
import 'package:zoftcare_machine_test/presentation/screens/splash/bloc/splash_bloc.dart';

import '../../../../common/constants/color_constants.dart';
import '../../../../domain/usecases/login_use_case.dart';
import '../../../../utils/debug_utils.dart';
import '../../../common_widgets/round_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../getx/auth_controller.dart';
import '../login_bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  final LoginUseCase loginUsecase = Get.find();

  final AuthController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    final authblocc = BlocProvider.of<LoginBloc>(context);

    final splashBloc = BlocProvider.of<SplashBloc>(context);

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: blueShade1,
            ),
          );
        }

        if (state is Authenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteList.postsListingScreen, (route) => false);
          });
        }

        if (state is AuthenticatedError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message.toString())));
          });
        }

        return SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              body: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: controller.loginFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Log ',
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'In',
                                    style: GoogleFonts.poppins(
                                        fontSize: 24, color: blueShade1),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Hello there, Login to continue",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff848484),
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            emailTextField(),
                            SizedBox(
                              height: 15.h,
                            ),
                            passwordTextField(context),
                            SizedBox(
                              height: 25.w,
                            ),
                            InkWell(
                              onTap: () {
                                // navService.pushNamed(MainPage.routeName);
                                if (controller.validate()) {
                                  authblocc.add(LoginCheckingEvent(
                                      password: _passwordController.text.trim(),
                                      email: _emailController.text.trim(),
                                      ));
                                }
                              },
                              child: Container(
                                width: 354.w,
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
                                    Text("Login",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                color: Colors.white),
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    RoundButtonWidget(
                                      bgColor: Colors.white,
                                      iconColor: blueShade1,
                                      onPressed: () {
                                        // navService.pushNamed(
                                        //     MainPage.routeName);
                                        if (controller.validate()) {
                                          authblocc.add(LoginCheckingEvent(
                                              password: _passwordController.text
                                                  .trim(),
                                              email:
                                              _emailController.text.trim(),));
                                        }
                                      },
                                      iconData: Icons.arrow_forward_ios,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 55.h,
                            ),
                            Center(
                              child: InkResponse(
                                onTap: (){
                                },
                                child: Text(
                                  "Version\n${splashBloc
                                      .appVersionModelEntity!.version}",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xff848484),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }

  Widget emailTextField(){
    return  SizedBox(
      width: 354.w,
      height: 74.h,
      child: TextFormField(
        controller: _emailController,
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: Color(0xff020202),
                fontSize: 14,
                fontWeight: FontWeight.w500)),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              borderSide: BorderSide(
                  color: Color(0xffF4F3F3), width: 2)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              borderSide: BorderSide(
                  color: Color(0xffF4F3F3), width: 2)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              borderSide: BorderSide(
                  color: Color(0xffF4F3F3), width: 2)),
          // contentPadding: EdgeInsets.all(8),
          filled: true,
          hintStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: Color(0xff020202),
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
          hintText: "Email or User name",
          fillColor: Colors.white,
        ),
        onChanged: (value) {
          if (value != "") {}
        },
        validator: (value) {
          if (value == "") {
            return "Email is required";
          }
        },
      ),
    );
  }

  Widget passwordTextField(BuildContext context){

    final authBloc = BlocProvider.of<LoginBloc>(context);

    return SizedBox(
      width: 354.w,
      height: 74.h,
      child: TextFormField(
        obscureText: authBloc.obsecure,
        controller: _passwordController,
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: Color(0xff020202),
                fontSize: 14,
                fontWeight: FontWeight.w500)),
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                    color: Color(0xffF4F3F3),
                    width: 2)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                    color: Color(0xffF4F3F3),
                    width: 2)),
            // errorBorder: const OutlineInputBorder(
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(20.0),
            //     ),
            //     borderSide: BorderSide(
            //         color: Colors.red, width: 2)
            // ),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                    color: Color(0xffF4F3F3),
                    width: 2)),
            // contentPadding: EdgeInsets.all(8),
            filled: true,
            hintStyle: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: Color(0xff020202),
                    fontSize: 12,
                    fontWeight: FontWeight.w400)),
            hintText: "Password",
            fillColor: Colors.white,
            suffixIcon: IconButton(
              icon: Icon(
                !authBloc.obsecure
                    ? Icons.remove_red_eye_sharp
                    : Icons.remove_red_eye_outlined,
                color: const Color(0xff848484),
              ),
              onPressed: () {
                consoleLog("Calling");
                authBloc.add(PasswordObsecureEvent());
              },
            )),
        onChanged: (value) {
          if (value != "") {}
        },
        validator: (value) {
          if (value == "") {
            return "Password is required";
          }
        },
      ),
    );
  }


}
