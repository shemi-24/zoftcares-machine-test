import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoftcare_machine_test/domain/entities/post_model_entity.dart';
import 'package:zoftcare_machine_test/presentation/screens/authentication/getx/auth_controller.dart';
import 'package:zoftcare_machine_test/presentation/screens/posts/bloc/post_bloc.dart';
import 'package:zoftcare_machine_test/presentation/screens/posts/widgets/post_list_widget.dart';
import 'package:zoftcare_machine_test/utils/debug_utils.dart';

import '../../../../common/constants/color_constants.dart';
import '../../../common_widgets/round_button.dart';

class PostsListingScreen extends StatefulWidget {
  static const String routeName = "/posts_listing";

  const PostsListingScreen({super.key});

  @override
  State<PostsListingScreen> createState() => _PostsListingScreenState();
}

class _PostsListingScreenState extends State<PostsListingScreen> {
  final ScrollController scrollController = ScrollController();

  late Timer countDown;

  int secondsLeft = 0;

  AuthController authController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int milliSeconds = authController.userEntity!.validity!.toInt();
    secondsLeft = milliSeconds ~/ 1000;
    consoleLog(secondsLeft);
    final bloc = BlocProvider.of<PostBloc>(context);

    countDown = Timer.periodic(const Duration(seconds: 1), (timer) {
      consoleLog("HERE");
      secondsLeft--;
      consoleLog("TIMER COUNTDOWN");
      consoleLog(secondsLeft);
      if (secondsLeft <= 0) {
        timer.cancel();
        bloc.add(PostLoadingEvent(1, 10));
      }
      setState(() {});
    });


    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent
      ) {

        bloc.add(IncreasePageCountEvent());

      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    countDown.isActive;
    scrollController.dispose();
  }




  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PostBloc>(context);

    return SafeArea(
        child: Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<PostBloc>(context);





          if (state is PostLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: blueShade1,
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  width: 414.w,
                  height: 145.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          stops: const [
                            0.1,
                            0.9
                          ],
                          colors: [
                            const Color(0xffE4E9FF).withOpacity(0.6),
                            Colors.white.withOpacity(1)
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RoundButtonWidget(
                              bgColor: blueShade1,
                              iconColor: Colors.white,
                              onPressed: () {
                                // navService.pushNamed(MainPage.routeName);
                                if (Platform.isAndroid) {
                                  SystemNavigator.pop();
                                } else if (Platform.isIOS) {
                                  exit(0);
                                }                              },
                              iconData: Icons.arrow_back_ios_new,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 240.w,
                              child: Text(
                                "Posts",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Color(0xff020202),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                bloc.postModelEntityList!.isNotEmpty
                    ? Expanded(
                        child: CupertinoScrollbar(
                          controller: scrollController,
                          child: ListView.builder(
                            controller: scrollController,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: PostListingWidget(
                                  postModelEntity:
                                      bloc.postModelEntityList![index],
                                ),
                              );
                            },
                            itemCount: bloc.postModelEntityList!.length,
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          "No data found!..",
                          style: GoogleFonts.poppins(fontSize: 18),
                        ),
                      ),
                Visibility(
                  visible: state is PaginationLoadingState,
                    child: const CircularProgressIndicator(
                  color: blueShade1,
                ))
              ],
            ),
          );
        },
      ),
    ));
  }
}
