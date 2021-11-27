import 'package:cash/domain/firebase.dart';
import 'package:cash/widgets/text_parameters.dart';
import 'package:flutter/material.dart';

class GialogWidget extends StatefulWidget {
  GialogWidget({Key? key}) : super(key: key);

  @override
  _GialogWidgetState createState() => _GialogWidgetState();
}

class _GialogWidgetState extends State<GialogWidget> {
  final TextEditingController controllerName = TextEditingController();
  Widget _actionText() {
    return const Padding(
      padding: EdgeInsets.only(top: 17),
      child: Align(
          alignment: Alignment.topCenter,
          child: TextParameters(
            text: 'creating a category',
            fontSize: 30.0,
          )),
    );
  }

  Widget _inputField() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: 250,
        child: TextField(
          autofocus: true,
          controller: controllerName,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white30,
            ),
            hintText: 'Name of new category',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 3,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _allButtons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            _button('CANCEL', () {
              Navigator.pop(context);
            }),
            Container(
              width: 3,
              height: 20,
              color: Colors.white,
            ),
            _button('SAVE', () {
              MyFireStore(name: '${controllerName.text}').AddCategory();
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }

  Widget _button(String buttonType, Function() buttonFunction) {
    return Flexible(
      //flex: 1,
      child: Center(
        // ignore: deprecated_member_use
        child: FlatButton(
          child: TextParameters(
            text: buttonType,
            fontSize: 20.0,
          ),
          onPressed: () => buttonFunction(),
        ),
      ),
    );
  }

  Widget _addWindow() {
    return SizedBox(
      height: 200,
      width: 240,
      child: Column(
        children: <Widget>[
          _actionText(),
          _inputField(),
          _allButtons(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 16,
      child: _addWindow(),
    );
  }
}
