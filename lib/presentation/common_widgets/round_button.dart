import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundButtonWidget extends StatefulWidget {
  final Color bgColor,iconColor;
  final Function()? onPressed;
  final IconData iconData;
  const RoundButtonWidget({super.key,required this.onPressed,required this.bgColor,required this.iconColor,required this.iconData});

  @override
  State<RoundButtonWidget> createState() => _RoundButtonWidgetState();
}

class _RoundButtonWidgetState extends State<RoundButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: widget.onPressed,
      child: Container(
        width: 39.w,
        height: 39.h,
        decoration: BoxDecoration(
          color: widget.bgColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(widget.iconData,size: 16,color: widget.iconColor,),
        ),
      ),
    );
  }
}
