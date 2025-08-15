import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_structure_architecture/features/controller/navbar_controller.dart';
import 'package:flutter_structure_architecture/features/view/widgets/navbar_items.dart';

class NavBarScreen extends StatelessWidget {
  final NavbarController controller = NavbarController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, -1),
            blurRadius: 7,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: controller.items
            .map((item) => NavbarItems(
                  iconPath: item.iconPath,
                  onTap: () {
                    if (item.onTap != null) {
                      item.onTap!(context);
                    }
                  },
                ))
            .toList(),
      ),
    );
  }
}
