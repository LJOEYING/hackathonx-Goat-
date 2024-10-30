import 'package:flutter/material.dart';

// A stateless widget that represents a waste container with an icon, label, and tap interaction.
// This widget can be reused to display various waste types, each with different icons and dimensions.
class WasteContainer extends StatelessWidget {
  // Constructor requires specific properties for the waste container icon, type, dimensions, and tap functionality.
  WasteContainer(
      {required this.wasteIcon,
      required this.wasteType,
      required this.wasteHeight,
      required this.wasteWidth,
      required this.onTap,
      super.key});

  String wasteIcon;
  String wasteType;
  double wasteWidth;
  double wasteHeight;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: 110,
          height: 110,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: const Color(0xffF1F1CD),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 3,
                  offset: Offset(0, 3),
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Display the waste icon image with specified dimensions
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
