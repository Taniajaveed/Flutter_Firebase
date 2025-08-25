import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure_architecture/features/view/add_to_cart_screen.dart';
import 'package:flutter_structure_architecture/features/view/widgets/cart_card.dart';

class OverViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Cart", //My Task
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddToCartScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Cart")
                  .where('creator',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData) {
                  return Text("no data here");
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return /*Dismissible(
                        key: ValueKey(index),
                        onDismissed: (direction) async {
                          if (direction == DismissDirection.endToStart) {
                            await FirebaseFirestore.instance
                                .collection('Cart')
                                .doc(snapshot.data!.docs[index].id)
                                .update({
                                  'newfield' : 'hello ',
                                  'color' : 'fffffff',
                                },);
                          }
                        },
                        child: */
                          CartCard(
                              title:
                                  snapshot.data!.docs[index].data()['title'] ??
                                      "",
                              description: snapshot.data!.docs[index]
                                      .data()['description'] ??
                                  "",
                              date: snapshot.data!.docs[index]
                                  .data()['date']
                                  .toString(),
                              color: snapshot.data!.docs[index]
                                      .data()['description'] ??
                                  "" /*Colors.bluegrey*/);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
