import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure_architecture/features/model/navbar_model.dart';
import 'package:flutter_structure_architecture/features/view/over_view_screen.dart';
import 'package:flutter_structure_architecture/features/view/user_login_screen.dart';

class NavbarController {
  final List<NavBarItemModel> items = [
    NavBarItemModel(
      iconPath: "assets/images/home.png",
    ),
    NavBarItemModel(iconPath: "assets/images/explore.png"),
    NavBarItemModel(iconPath: "assets/images/cart.png"),
    NavBarItemModel(
        iconPath: "assets/images/user.png",
        onTap: (context) {
          final user = FirebaseAuth.instance.currentUser;
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.data != null) {
                    return OverViewScreen();
                  }
                  return UserLoginScreen();
                });
          }));
        }),
  ];
}
