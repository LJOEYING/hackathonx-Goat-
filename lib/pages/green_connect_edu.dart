import 'package:flutter/material.dart';
import 'package:hackathonx/widgets/waste_container.dart';

class GreenConnectEdu extends StatelessWidget {
  const GreenConnectEdu({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                'Category',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  WasteContainer(
                    wasteIcon: 'yes',
                    wasteType: 'Recyclable',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
