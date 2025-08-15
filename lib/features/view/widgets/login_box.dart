import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBox extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const LoginBox({Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 363,
      height: 63.h,
      margin: EdgeInsets.symmetric(horizontal: 35.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: Color(0xff000000).withOpacity(0.4),
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: text,
        ),
      ),
    );
  }
}
