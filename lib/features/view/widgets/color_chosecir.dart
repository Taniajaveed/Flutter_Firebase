import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorChosecir extends StatelessWidget {
  final Color color;
  ColorChosecir({required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 23.w,
      height: 21.h,
      margin: EdgeInsets.only(right: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(3.r),
        border: Border.all(
          color: Color(0xff000000).withOpacity(0.2),
          width: 0.5,
        ),
      ),
      child: Container(
        width: 16.w,
        height: 16.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: color,
        ),
      ),
    );
  }
}
