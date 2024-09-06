

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:zoftcare_machine_test/common/constants/constants.dart';
import 'package:zoftcare_machine_test/domain/entities/post_model_entity.dart';
import 'package:zoftcare_machine_test/presentation/screens/posts/bloc/post_bloc.dart';

import '../../../../common/constants/color_constants.dart';
import '../../../common_widgets/round_button.dart';
import '../../../route/route_constants.dart';

class PostListingWidget extends StatelessWidget {
  final PostModelEntity postModelEntity;
  const PostListingWidget({super.key, required this.postModelEntity});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
  builder: (context, state) {

    final bloc =  BlocProvider.of<PostBloc>(context);


    return Container(
      width:  348.w,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18.h,),
          contentWidget(),
          SizedBox(height: 25.h,),
          InkResponse(
            onTap: (){

            },
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 260.w,
                  height: 66.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(19),topRight: Radius.circular(19)),
                    color: Color(0xff24A0C2)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("ACTION :",style: GoogleFonts.poppins(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500),),
                      SizedBox(width: 8.w,),
                      Text("View Details",style: GoogleFonts.poppins(fontSize: 13,color: Colors.white,fontWeight: FontWeight.w400,decoration: TextDecoration.underline),),
            
                    ],
                  ),
                ),
            ]
            ),
          )

        ],
      ),
    );
  },
);
  }

  Widget contentWidget(){
    return Row(
      children: [
        CachedNetworkImage(
          placeholder: (context, url) => Center(child: const CircularProgressIndicator(color: blueShade1,)),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          // imageUrl: "https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9",width: 150,height: 150,),
          imageUrl: postModelEntity.image!,width: 150,height: 150,),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width:120.w,child: Text(postModelEntity.title!,style: GoogleFonts.poppins(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500),)),
            SizedBox(height: 12.h,),
            SizedBox(width:180.w,child: Text(postModelEntity.body!,style: GoogleFonts.poppins(fontSize: 13,color: Colors.black,fontWeight: FontWeight.normal),)),

          ],
        )
      ],
    );
  }
}
