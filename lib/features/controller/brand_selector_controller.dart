class BrandSelectorController {

  final List<String> brands = ["All", "Nike", "Adidas", "Converse", "Puma"];

  int selectedIndex = -1;
  void selectedBrand (int index) {
    selectedIndex = index;
  }
}