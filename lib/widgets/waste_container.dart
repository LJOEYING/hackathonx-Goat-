import 'package:flutter/material.dart';

class WasteContainer extends StatelessWidget {
  WasteContainer({required this.wasteIcon, required this.wasteType, super.key});

  String wasteIcon;
  String wasteType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xffF1F1CD),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                offset: Offset(0, 3),
              )
            ]),
        child: Column(
          children: [
            Image.asset(
              'assets/icon1.png',
              width: 50,
              height: 50,
            ),
            Text(wasteType)
          ],
        ),
      ),
    );
  }
}
