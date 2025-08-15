import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextBox extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  const TextBox(
      {required this.text, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.w,
        height: 31.h,
        margin: EdgeInsets.only(right: 11.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff1F3643) : Colors.transparent,
          border: Border.all(
            color: Color(0xff000000).withOpacity(0.36),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
            color: isSelected
                ? Color(0xffFFFFFF)
                : Color(0xff000000).withOpacity(0.36),
          ),
        ),
      ),
    );
  }
}
