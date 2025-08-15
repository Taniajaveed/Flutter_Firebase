import 'package:flutter/material.dart';

typedef VoidCallback = void Function(BuildContext context);

class NavBarItemModel {
  final String iconPath;
  final VoidCallback? onTap;
  NavBarItemModel({
    required this.iconPath,
    this.onTap,
  });
}
