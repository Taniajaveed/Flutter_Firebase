import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_structure_architecture/features/view/widgets/login_box.dart';

class UserLoginScreen extends StatefulWidget {
  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  final emailController = TextEditingController();
  final PasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  Future<void> createUserwithEmailandPassword() async {
    try {
      final UserCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: PasswordController.text.trim());
      print(UserCredential.user?.uid);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Login",
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
            controller: PasswordController,
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
                await createUserwithEmailandPassword();
              },
              icon: Text(
                "Log In",
                style: TextStyle(
                  fontSize: 18.sp.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ),
          Text(
            "Already have an account?? Signup",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: Color(0xff1F3643),
            ),
          ),
        ],
      ),
    );
  }
}
