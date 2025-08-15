import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_structure_architecture/features/controller/home_controller.dart';

class ShoeBox extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final bool showHeart;
  final EdgeInsetsGeometry? margin;
  final HomeController _controller = HomeController(); // instance

  ShoeBox({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.price,
    this.margin,
    this.showHeart = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 171.w,
      height: 234.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: 170.w,
                height: 184.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xffF0F0F0),
                ),
                child: GestureDetector(
                  onTap: () => _controller.goToShoeDetail(context),
                  child: Container(
                    width: 149.w,
                    height: 99.25.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                      ),
                    ),
                  ),
                ),
              ),
              // ✅ Conditional heart
              if (showHeart)
                Padding(
                  padding: EdgeInsets.only(top: 10.h, right: 10.w),
                  child: Container(
                      height: 22.w,
                      width: 22.h,
                      child: Icon(
                        Icons.favorite_outline,
                      )),
                ),
            ],
          ),
          SizedBox(height: 4.h),
          Container(
            width: 80.w,
            height: 20.h,
            child: Text(
              name,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000).withOpacity(0.7),
              ),
            ),
          ),
          Container(
            width: 42.w,
            height: 20.h,
            child: Text(
              price,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff1F3643),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
