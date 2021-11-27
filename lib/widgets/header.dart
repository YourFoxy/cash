import 'package:cash/widgets/text_parameters.dart';
import 'package:flutter/material.dart';

class HeaderWidgets extends StatelessWidget {
  HeaderWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: 350.0,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Theme.of(context).primaryColor,
              const Color(0xFFDCE0EE),
            ],
          ),
          image: const DecorationImage(image: AssetImage('images/bitmap.png')),
        ),
        child: Center(
          child: TextParameters(text: 'text', fontSize: 30.0),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80.0);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80.0);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
