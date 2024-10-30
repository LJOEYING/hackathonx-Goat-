import 'package:flutter/material.dart';
import 'package:hackathonx/pages/carpool/carpool.dart';

class CreateNewPostDialog extends StatefulWidget {
  const CreateNewPostDialog({super.key});

  @override
  _CreateNewPostDialogState createState() => _CreateNewPostDialogState();
}

class _CreateNewPostDialogState extends State<CreateNewPostDialog> {
  bool isDriver = true; // Indicates if the user is a driver or passenger
  String? _location; // Locations 
  DateTime? _date; // Date 
  TimeOfDay? _time; // Time 
  double _price = 0; //price per person of the ride
  int _totalSeats = 1; 
  int _totalPersons = 1;

  // Method to select a date from a date picker
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date ?? DateTime.now(), // Set the initial date to now if not selected
      firstDate: DateTime(2010), // Minimum date selectable
      lastDate: DateTime(2100), // Maximum date selectable
    );

    if (picked != null) {
      setState(() {
        _date = picked; // Update the selected date
      });
    }
  }

  // Method to select a time from a time picker
  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time ?? TimeOfDay.now(), // Set the initial time to now if not selected
    );

    if (picked != null) {
      setState(() {
        _time = picked; // Update the selected time
      });
    }
  }

  // Widget to build a number selector for total seats or persons
  Widget _buildNumberSelector({
    required String label,
    required int value,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19.0,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: onDecrement,
            ),
            Text(
              '$value', // Display current value
              style: const TextStyle(fontSize: 18.0),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: onIncrement,
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(thickness: 1.0, color: Colors.grey),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Create New Post', // Title of the dialog
        style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 0, bottom: 0.0),
              child: Divider(
                thickness: 3.0,
                color: Colors.black,
              ),
            ),
            // Button to toggle between Driver and Passenger
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: DividedButton(
                leftText: 'Driver',
                rightText: 'Passenger',
                onPressed: () {
                  setState(() {
                    isDriver = !isDriver; // Toggle the user type
                  });
                },
                leftColor: isDriver ? Colors.black : Colors.grey,
                rightColor: isDriver ? Colors.grey : Colors.black,
              ),
            ),
            // Location selection
            const Text(
              'Location',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
            const SizedBox(height: 13.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: DropdownButtonFormField<String>(
                value: _location, // Current selected location
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 6.0),
                  border: InputBorder.none,
                ),
                hint: const Text('Select a location to go'),
                items: [
                  'IOI City Mall',
                  'Mid Valley Megamall',
                  'Pavillion KL',
                  'Cheras Traders Square',
                  'Terminal Bersepadu Selatan (TBS)'
                ].map((state) {
                  return DropdownMenuItem<String>(
                    value: state,
                    child: Text(state), // Display location options
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _location = value; // Update selected location
                  });
                },
                isExpanded: true,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(top: 0, bottom: 20.0),
              child: Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
            ),
            // Date selection
            const Text(
              'Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: _selectDate, // Open date picker
              child: Text(
                _date != null
                    ? _date!.toLocal().toString().split(' ')[0] // Display selected date
                    : 'Select date', // Placeholder text
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 17.0,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(top: 0, bottom: 20.0),
              child: Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
            ),
             // Time selection
            const Text(
              'Time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: _selectTime, // Open time picker
              child: Text(
                _time != null ? _time!.format(context) : 'Select time', // Display selected time
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 17.0,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(top: 0, bottom: 20.0),
              child: Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
            ),
           
            if (isDriver) ...[
              // Display price per person for drivers
              Text(
                'Price Per Person: ${_price.toStringAsFixed(2)}', // Display current price
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19.0,
                ),
              ),
              Slider(
                value: _price,
                min: 0, // Minimum price
                max: 100, // Maximum price
                onChanged: (value) {
                  setState(() {
                    _price = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(top: 0, bottom: 20.0),
                child: Divider(
                  thickness: 1.0,
                  color: Colors.grey,
                ),
              ),
              // Number selector for total available seats
              _buildNumberSelector(
                label: 'Total Available Seats',
                value: _totalSeats, // Current total seats
                onIncrement: () {
                  setState(() {
                    _totalSeats++; // Increment total seats
                  });
                },
                onDecrement: () {
                  if (_totalSeats > 1) {
                    setState(() {
                      _totalSeats--; // Decrement total seats if greater than 1
                    });
                  }
                },
              ),
            ] else ...[
              // Number selector for total persons if passenger
              _buildNumberSelector(
                label: 'Total Persons',
                value: _totalPersons, // Current total persons
                onIncrement: () {
                  setState(() {
                    _totalPersons++; // Increment total persons
                  });
                },
                onDecrement: () {
                  if (_totalPersons > 1) {
                    setState(() {
                      _totalPersons--; // Decrement total persons if greater than 1
                    });
                  }
                },
              ),
            ],
          ],
        ),
      ),
       actions: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, 
          children: [
            // Cancel button
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            // Done button (for create new post)
            ElevatedButton(
              child: Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
