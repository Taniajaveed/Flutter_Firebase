import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_structure_architecture/features/controller/shoelist_controller.dart';
import 'package:flutter_structure_architecture/features/view/navbar_screen.dart';
import 'package:flutter_structure_architecture/features/view/widgets/brand_selector.dart';
import 'package:flutter_structure_architecture/features/view/widgets/shoe_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 35.w),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //width: 51.w,
                        height: 20.h,
                        margin: EdgeInsets.only(
                          top: 43.h,
                        ), //left: 35
                        alignment: Alignment.center,
                        child: Text(
                          "Hi Emily!",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        height: 45.h,
                        width: 45.w,
                        margin: EdgeInsets.only(top: 35.h), //right: 35.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.5.r),
                          color: Color(0xffD9D9D9),
                          image: DecorationImage(
                            image: AssetImage('assets/images/avatar.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    //width: 102,
                    height: 20.h,
                    //margin: EdgeInsets.only(left: 35.w),
                    child: Text(
                      "Good Evening!",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 295.w,
                        height: 46.h,
                        //margin: EdgeInsets.only(left: 35.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0.r),
                          border: Border.all(
                            color: Color(0xff000000).withOpacity(0.36),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 12.w, top: 12.h),
                          child: Container(
                            width: 39.w,
                            height: 20.h,
                            margin: EdgeInsets.only(right: 36.w),
                            child: Text(
                              "Search",
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff000000).withOpacity(0.74),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 51.w,
                        height: 46.h,
                        decoration: BoxDecoration(
                          color: Color(0xff1F3643),
                          borderRadius: BorderRadius.circular(8.0.r),
                        ),
                        child: Container(
                          width: 24.w,
                          height: 24.h,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.search_outlined,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BrandSelector(),
                  SizedBox(
                    height: 16.w, //43-27 = 16
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: shoeList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 19.w,
                          // mainAxisSpacing: 27.w,
                          childAspectRatio: 171 / 234),
                      itemBuilder: (context, index) {
                        final shoe = shoeList[index];
                        return ShoeBox(
                          imagePath: shoe['imagePath'],
                          name: shoe['name'],
                          price: shoe['price'],
                          showHeart: shoe['showHeart'] ?? false,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBarScreen(),
    );
  }
}
