import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MyFireStore {
  String name;
  MyFireStore({required this.name});
  Future<void> moneyPerDay() {
    return FirebaseFirestore.instance
        .collection('category')
        .doc(name)
        .collection('years')
        .doc(DateFormat.y().format(DateTime.now()))
        .collection('months')
        .doc(DateFormat.MMMM().format(DateTime.now()))
        .collection('days')
        .doc(DateFormat.d().format(DateTime.now()))
        .set({
      'spending': 0 as num,
      'earnings': 0 as num,
    });
  }

  Future<void> moneyPerMonths() {
    return FirebaseFirestore.instance
        .collection('category')
        .doc(name)
        .collection('years')
        .doc(DateFormat.y().format(DateTime.now()))
        .collection('months')
        .doc(DateFormat.MMMM().format(DateTime.now()))
        .set({
      'spending': 0 as num,
      'earnings': 0 as num,
    });
  }

  Future<void> moneyPerYears() {
    return FirebaseFirestore.instance
        .collection('category')
        .doc(name)
        .collection('years')
        .doc(DateFormat.y().format(DateTime.now()))
        .set({
      'spending': 0 as num,
      'earnings': 0 as num,
    });
  }

  Future<void> nameOfCategory() {
    return FirebaseFirestore.instance.collection('category').doc(name).set({
      'name': name,
      //'earnings': 0 as num,
    });
  }

  void AddCategory() {
    nameOfCategory();
    moneyPerYears();
    moneyPerMonths();
    moneyPerDay();
  }
}
