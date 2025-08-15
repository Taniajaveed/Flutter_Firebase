import 'package:flutter/widgets.dart';

class NavbarItems extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onTap;
  NavbarItems({required this.iconPath, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(iconPath),
          ),
        ),
      ),
    );
  }
}
