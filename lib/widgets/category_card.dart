import 'package:cash/widgets/text_parameters.dart';
import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, bottom: 30.0, top: 30.0),
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 17),
            blurRadius: 20,
            spreadRadius: -13,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      child: Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.food_bank_outlined,
              color: Colors.white,
              size: 40.0,
            ),
          ),
          TextParameters(text: 'еда', fontSize: 30.0),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextParameters(text: 'сумма', fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
