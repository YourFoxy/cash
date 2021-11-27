import 'package:cash/widgets/text_parameters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardForEditScreenWidget extends StatelessWidget {
  Function del;
  String name;
  CardForEditScreenWidget({Key? key, required this.del, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        FirebaseFirestore.instance
            .collection('category')
            .doc(name)
            .collection('years')
            .get()
            .then((snapshot) {
          for (DocumentSnapshot ds in snapshot.docs) {
            ds.reference.delete();
          }
        });
      },
      child: Container(
        height: 100,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              //padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.food_bank_outlined,
                color: Colors.white,
                size: 40.0,
              ),
            ),
            Expanded(
              flex: 3,
              child: TextParameters(text: name, fontSize: 40.0),
            ),
          ],
        ),
      ),
    );
  }
}
