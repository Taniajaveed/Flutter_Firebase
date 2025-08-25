import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartModel {
  final String id;
  final String title;
  final String description;
  final String creator;
  final DateTime date;
  final DateTime postedAt;
  final String color;

//Color
  CartModel({
    required this.id,
    required this.title,
    required this.description,
    required this.creator,
    required this.date,
    required this.postedAt,
    required this.color,
  });
  factory CartModel.fromMap(Map<String, dynamic> map, String docId) {
    return CartModel(
      id: docId,
      title: map["title"] ?? "",
      description: map["description"] ?? "",
      creator: map["creator"] ?? "",
      date: (map["date"] as Timestamp).toDate(),
      postedAt: (map["PostedAt"] as Timestamp).toDate(),
      color: map["color"] ?? "000000",
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "creator": creator,
      "date": date,
      "PostedAt": postedAt,
      "color": color,
    };
  }
}
