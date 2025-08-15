import 'package:flutter/material.dart';
import 'package:flutter_structure_architecture/features/controller/brand_selector_controller.dart';
import 'text_box.dart';

class BrandSelector extends StatefulWidget {
  const BrandSelector({super.key});

  @override
  State<BrandSelector> createState() => _BrandSelectorState();
}

class _BrandSelectorState extends State<BrandSelector> {
  final BrandSelectorController controller = BrandSelectorController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        controller.brands.length,
        (index) {
          return TextBox(
            text: controller.brands[index],
            isSelected: controller.selectedIndex == index,
            onTap: () {
              setState(
                () {
                  controller.selectedBrand(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}
