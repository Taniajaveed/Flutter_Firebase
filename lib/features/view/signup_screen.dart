import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_structure_architecture/features/view/home_screen.dart';
import 'package:flutter_structure_architecture/features/view/widgets/login_box.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> createUserWithEmailandPassword() async {
    try {
      final UserCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (User != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(title: "mm"),
          ),
        );
      }
      print(UserCredential.user);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.w700,
              color: Color(0xff1F3643),
            ),
          ),
          SizedBox(
            height: 40.sp,
          ),
          LoginBox(
            text: "   Email",
            controller: emailController,
          ),
          SizedBox(
            height: 15.sp,
          ),
          LoginBox(
            text: "   Password",
            controller: passwordController,
          ),
          SizedBox(
            height: 300,
          ),
          Container(
            width: 363.w,
            height: 63.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: Color(0xff298DC6),
            ),
            child: IconButton(
              onPressed: () async {
                await createUserWithEmailandPassword();
              },
              icon: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 18.sp.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ),
          // Text(
          //   "Already have an account?? Signup",
          //   style: TextStyle(
          //     fontSize: 12.sp,
          //     fontWeight: FontWeight.w700,
          //     color: Color(0xff1F3643),
          //   ),
          // ),
        ],
      ),
    );
  }
}
