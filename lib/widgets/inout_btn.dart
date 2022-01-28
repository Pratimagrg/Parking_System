import 'package:flutter/material.dart';

class InOutClass extends StatelessWidget {
  const InOutClass({Key? key, required this.imgName, required this.onPress})
      : super(key: key);
  final String imgName;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Container(
        alignment: Alignment.center,
        height: 180,
        width: MediaQuery.of(context).size.width * 0.65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x60000000),
              offset: Offset(0, 6),
              blurRadius: 6,
            ),
          ],
        ),
        child: Image(
          image: AssetImage('assets/images/$imgName.png'),
        ),
      ),
    );
  }
}
