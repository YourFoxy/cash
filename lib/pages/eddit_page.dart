import 'package:cash/pages/home_page.dart';
import 'package:cash/widgets/bottom_menu.dart';
import 'package:cash/widgets/card_for_edit_screen.dart';
import 'package:cash/widgets/dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EdditPage extends StatefulWidget {
  EdditPage({Key? key}) : super(key: key);

  @override
  _EdditPageState createState() => _EdditPageState();
}

Widget _showCategories() {
  return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('category').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data == null) {
          return Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ));
        }
        return ListView(
            // scrollDirection: Axis.horizontal,
            children: snapshot.data!.docs.map((categories) {
          Map<String, dynamic> data = categories.data() as Map<String, dynamic>;

          return CardForEditScreenWidget(
            del: () {
              categories.reference.delete();
            },
            name: data['name'],
          );
        }).toList());
      });
}

class _EdditPageState extends State<EdditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _showCategories(),
      // SingleChildScrollView(
      //   child: Column(
      //     children: <Widget>[
      //       CardForEditScreenWidget(),
      //       CardForEditScreenWidget(),
      //       CardForEditScreenWidget(),
      //     ],
      //   ),
      // ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
              barrierColor: Colors.black54,
              context: context,
              builder: (context) {
                return GialogWidget();
              });
        },
        // AddingCategory().add(context),
        //AddingCategory(context: context).add(),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomMEnuWidget(
        leftIcon: Icons.home_filled,
        rightIcon: Icons.checklist_rounded,
        leftFunc: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        rightFunc: () {},
      ),
    );
  }
}
