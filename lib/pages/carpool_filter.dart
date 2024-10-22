import 'package:flutter/material.dart';

class CarPoolFilter extends StatelessWidget {
  const CarPoolFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Car Pool Filter', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
           DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Location'),
            items: [
              DropdownMenuItem(value: 'Drive Hill', child: Text('Drive Hill')),
              DropdownMenuItem(
                  value: 'Cheras Traders Square',
                  child: Text('Cheras Traders Square')),
              DropdownMenuItem(value: 'Pavilion KL', child: Text('Pavilion KL')),
              DropdownMenuItem(value: 'IOI City Mall', child: Text('IOI City Mall')),
              DropdownMenuItem(value: 'TBS', child: Text('TBS')),
            ],
            onChanged: null,
          ),
          const SizedBox(height: 10),
          const Text('Time', style: TextStyle(fontSize: 16)),
          Row(
            children: const [
              Expanded(child: TextField(decoration: InputDecoration(hintText: 'HH'))),
              Expanded(child: TextField(decoration: InputDecoration(hintText: 'MM'))),
            ],
          ),
          const SizedBox(height: 10),
          const Text('Gender Preferred', style: TextStyle(fontSize: 16)),
          Row(
            children: const [
              Icon(Icons.male, color: Colors.blue),
              Icon(Icons.female, color: Colors.pink),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close the filter modal
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
