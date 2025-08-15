import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_structure_architecture/features/view/widgets/color_chosecir.dart';

class ShoeApp extends StatefulWidget {
  const ShoeApp({super.key});

  @override
  State<ShoeApp> createState() => _ShoeAppState();
}

class _ShoeAppState extends State<ShoeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12.h, left: 12.w, right: 12.w),
              child: Container(
                width: 407.w,
                height: 421.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(29.r),
                    topRight: Radius.circular(29.r),
                  ),
                  color: Color(0xffF0F0F0),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 18.w, bottom: 350.h),
                          child: Container(
                            height: 22.h,
                            width: 22.w,
                            child: Icon(Icons.arrow_back,
                                size: 22, color: Color(0xff000000)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 18.w, bottom: 350.h),
                          child: Container(
                              height: 22.h,
                              width: 22.w,
                              child: Icon(Icons.favorite_outline)),
                        ),
                      ],
                    ),
                    Container(
                      width: 368.28.w,
                      height: 310.03.h,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/shoe2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        width: 42.w,
                        height: 10.h,
                        child: Icon(Icons.more_horiz_sharp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 31.h,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 121.w,
                        height: 20.h,
                        child: Text(
                          'NikeCourt Air',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.star,
                        size: 14,
                        color: Color(0xff298DC6),
                      ),
                      Container(
                        width: 63,
                        height: 20,
                        alignment: Alignment.center,
                        child: Text(
                          "4.5(25 Reviews)",
                          style: TextStyle(
                              fontSize: 7.96.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff298DC6)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Container(
                    height: 20.h,
                    width: 69.w,
                    child: Text(
                      "\$199.99",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff298DC6),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 20.h,
                    width: 42.w,
                    child: Text(
                      'Details',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1F3643),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 70.h,
                    width: 360.w,
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Nike Dri-FIT is a polyester fabric designed to help you keep dry so you \ncan more comfortably work harder, longer. levate your footwear \ncollection with a perfect blend of heritage and contemporary design.",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000).withOpacity(0.7),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Container(
                    width: 36.w,
                    height: 20.h,
                    alignment: Alignment.center,
                    child: Text(
                      "Color:",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1F3643),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ColorChosecir(
                        color: Color(0xff0174B7),
                      ),
                      ColorChosecir(
                        color: Color(0xff000000),
                      ),
                      ColorChosecir(
                        color: Color(0xffE79A28),
                      ),
                      ColorChosecir(
                        color: Color(0xffDE42B2),
                      ),
                      ColorChosecir(
                        color: Color(0xff96A1A8),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 27.w,
                    height: 20.h,
                    alignment: Alignment.center,
                    child: Text(
                      "Size:",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1F3643),
                      ),
                    ),
                  ),
                  Container(
                    width: 94.w,
                    height: 27.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(
                        color: Color(0xff000000).withOpacity(0.2),
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 49.w,
                          height: 15.h,
                          alignment: Alignment.center,
                          child: Text(
                            " Choose Size",
                            style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff00000000).withOpacity(0.7),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 18.w,
                        ),
                        Container(
                          width: 17.w,
                          height: 17.h,
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 12,
                            color: Color(0xff1F3643),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 45.w,
                  ),
                  Container(
                    width: 363.w,
                    height: 63.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.r),
                      color: Color(0xff298DC6),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Text(
                        "Buy Now",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
