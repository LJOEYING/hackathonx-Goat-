import 'package:flutter/material.dart';

class WasteContainer extends StatelessWidget {
  WasteContainer(
      {required this.wasteIcon,
      required this.wasteType,
      required this.wasteHeight,
      required this.wasteWidth,
      super.key});

  String wasteIcon;
  String wasteType;
  double wasteWidth;
  double wasteHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: 110,
          height: 110,
          padding: EdgeInsets.all(2),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                wasteIcon,
                width: wasteWidth,
                height: wasteHeight,
              ),
              Text(
                wasteType,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
