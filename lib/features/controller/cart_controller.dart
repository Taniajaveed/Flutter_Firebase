import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure_architecture/features/model/cart_model.dart';
import 'package:flutter_structure_architecture/screenutils.dart';
import 'package:uuid/uuid.dart';

class CartController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Color _selectedColor = Colors.blue;

  Color? selectedColor;
  Color? selectedShade;

  Future<void> AddCartToDb() async {
    try {
      final uuid = Uuid();
      final id = uuid.v4();

      final cart = CartModel(
          id: id,
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          creator: FirebaseAuth.instance.currentUser!.uid,
          date: DateTime.now(),
          postedAt: DateTime.now(),
          color: rgbToHex(_selectedColor));
      await FirebaseFirestore.instance.collection("Cart").doc().set(
            cart.toMap(),
          );

      print(id); //print(data.id);
    } catch (e) {
      print(e);
    }
  }

  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
  }
}
