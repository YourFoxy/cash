import 'package:cash/domain/firebase.dart';
import 'package:cash/pages/eddit_page.dart';
import 'package:cash/widgets/bottom_menu.dart';
import 'package:cash/widgets/category_card.dart';
import 'package:cash/widgets/header.dart';
import 'package:intl/intl.dart';
import 'package:shelf_proxy/shelf_proxy.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/date_symbol_data_file.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFDDE1ED),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderWidgets(),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const <Widget>[
                  CategoryCardWidget(),
                  CategoryCardWidget(),
                  CategoryCardWidget(),
                ],
              ),
            ),

            // Container(hecolor: Colors.amber,),
          ],
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          // MyFireStore().addCategory();
        },
        // AddingCategory().add(context),
        //AddingCategory(context: context).add(),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomMEnuWidget(
        leftIcon: Icons.settings,
        rightIcon: Icons.checklist_rounded,
        leftFunc: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EdditPage()),
          );
        },
        rightFunc: () {
          // print('DATE ${DateTime.utc}');
          // print(DateFormat.yMMMd().format(DateTime.now()));
          //DateTime.now();
        },
      ),
    );
  }
}
