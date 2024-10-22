import 'package:flutter/material.dart';

class CreateNewPostDialog extends StatelessWidget {
  const CreateNewPostDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create New Post'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Driver/Passenger', style: TextStyle(fontSize: 18)),
          ToggleButtons(
            children: const [Text('Driver'), Text('Passenger')],
            isSelected: const [true, false],
            onPressed: (int index) {},
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Location'),
            items: [
              DropdownMenuItem(value: 'Drive Hill', child: Text('Drive Hill')),
              DropdownMenuItem(
                  value: 'Cheras Traders Square',
                  child: Text('Cheras Traders Square')),
            ],
            onChanged: null,
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(labelText: 'Time'),
          ),
          const TextField(
            decoration: InputDecoration(labelText: 'Total Seats Available'),
          ),
          const TextField(
            decoration: InputDecoration(labelText: 'Price Per Person'),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Submit the new post and close the dialog
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
