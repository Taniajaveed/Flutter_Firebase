import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({Key? key}) : super(key: key);

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen>
    with SingleTickerProviderStateMixin {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Color _selectedColor = Colors.blue;

  late TabController _tabController;
  Color? selectedColor;
  Color? selectedShade;

  final List<Color> primaryColors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.indigo,
    Colors.blue,
    Colors.cyan,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.blueGrey,
    Colors.grey,
  ];

  final List<Color> shades = [
    Colors.lightBlue.shade50,
    Colors.lightBlue.shade100,
    Colors.lightBlue.shade200,
    Colors.lightBlue.shade300,
    Colors.lightBlue.shade400,
    Colors.lightBlue.shade500,
    Colors.blue.shade600,
    Colors.blue.shade700,
  ];

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> AddCartToDb() async {
    try {
      final uuid = Uuid();
      final id = uuid.v4();
      /*final data =*/ await FirebaseFirestore.instance
          .collection("Cart")
          .doc(id)
          .set({
        "title": titleController.text.trim(),
        "description": descriptionController.text.trim(),
        "creator": FirebaseAuth.instance.currentUser!.uid,
        "date": selectedDate,
        "PostedAt": FieldValue.serverTimestamp(),
        "color": rgbToHex(_selectedColor),
      });

      print(id); //print(data.id);
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Widget buildColorOption(Color color, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
          border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
        ),
        child: isSelected
            ? const Icon(Icons.check, color: Colors.white, size: 20)
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add to Cart"),
        actions: [
          GestureDetector(
            onTap: () async {
              final selDate = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 90)),
              );
              if (selDate != null) {
                setState(() {
                  selectedDate = selDate;
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                DateFormat('MM-dd_y').format(selectedDate),
              ),
            ),
          ),
        ],
      ),

      // backgroundColor: const Color(0xffFAF5FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Title field
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Description field
              TextFormField(
                maxLines: 3,
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text("Select color", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),

              // Tabs for Primary / Accent / Wheel
              Container(
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(text: "Primary"),
                    Tab(text: "Accent"),
                    Tab(text: "Wheel"),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Colors Grid
              SizedBox(
                height: 110,
                child: GridView.count(
                  crossAxisCount: 6,
                  children: primaryColors
                      .map(
                        (color) => buildColorOption(
                          color,
                          selectedColor == color,
                          () {
                            setState(() {
                              selectedColor = color;
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
              ),

              const SizedBox(height: 10),
              const Text("Select a different shade",
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),

              // Shades row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: shades
                      .map(
                        (shade) => buildColorOption(
                          shade,
                          selectedShade == shade,
                          () {
                            setState(() {
                              selectedShade = shade;
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
              ),

              const Spacer(),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    await AddCartToDb();
                  },
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String rgbToHex(Color color) {
  return '${color.red.toRadixString(16).padLeft(2, '0')}${color.green.toRadixString(16).padLeft(2, '0')}${color.blue.toRadixString(16).padLeft(2, '0')}';
}
