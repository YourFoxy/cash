import 'package:cash/pages/eddit_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomMEnuWidget extends StatelessWidget {
  IconData leftIcon;
  IconData rightIcon;
  Function leftFunc;
  Function rightFunc;
  BottomMEnuWidget({
    Key? key,
    required this.leftIcon,
    required this.rightIcon,
    required this.leftFunc,
    required this.rightFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomAppBar(
          color: Theme.of(context).primaryColor,
          shape: CircularNotchedRectangle(),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    leftFunc();
                  },
                  icon: Icon(leftIcon),
                  color: Colors.white,
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    rightFunc();
                    print(DateFormat.yMMM().format(DateTime.now()));
                  },
                  icon: Icon(rightIcon),
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}
