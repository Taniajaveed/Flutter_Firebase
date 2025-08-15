import 'package:flutter/material.dart';
import 'package:flutter_structure_architecture/features/view/shoe_detail_screen.dart';

class HomeController {
  void goToShoeDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ShoeApp()),
    );
  }
}
