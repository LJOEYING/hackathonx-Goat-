import 'package:flutter/material.dart';
import 'package:hackathonx/pages/carpool/carpool.dart';

class CreateNewPostDialog extends StatefulWidget {
  const CreateNewPostDialog({super.key});

  @override
  _CreateNewPostDialogState createState() => _CreateNewPostDialogState();
}

class _CreateNewPostDialogState extends State<CreateNewPostDialog> {
  bool isDriver = true;
  String? _location;
  DateTime? _date;
  TimeOfDay? _time;
  double _price = 0;
  int _totalSeats = 1;
  int _totalPersons = 1;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date ?? DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _date = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time ?? TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _time = picked;
      });
    }
  }

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
              '$value',
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
        'Create New Post',
        style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 0.0),
              child: Divider(
                thickness: 3.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: DividedButton(
                leftText: 'Driver',
                rightText: 'Passenger',
                onPressed: () {
                  setState(() {
                    isDriver = !isDriver;
                  });
                },
                leftColor: isDriver ? Colors.black : Colors.grey,
                rightColor: isDriver ? Colors.grey : Colors.black,
              ),
            ),
            Text(
              'Location',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
            SizedBox(height: 13.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: DropdownButtonFormField<String>(
                value: _location,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 6.0),
                  border: InputBorder.none,
                ),
                hint: Text('Select a location to go'),
                items: [
                  'IOI City Mall',
                  'Olive Hill',
                  'Pavillion KL',
                  'Cheras Traders Square',
                  'Terminal Bersepadu Selatan (TBS)'
                ].map((state) {
                  return DropdownMenuItem<String>(
                    value: state,
                    child: Text(state),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _location = value;
                  });
                },
                isExpanded: true,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 20.0),
              child: Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
            ),
            Text(
              'Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: _selectDate,
              child: Text(
                _date != null
                    ? '${_date!.toLocal().toString().split(' ')[0]}'
                    : 'Select date',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 17.0,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 20.0),
              child: Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
            ),
            Text(
              'Time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: _selectTime,
              child: Text(
                _time != null ? '${_time!.format(context)}' : 'Select time',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 17.0,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 20.0),
              child: Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
            ),
           
            if (isDriver) ...[
              Text(
                'Price Per Person: ${_price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19.0,
                ),
              ),
              Slider(
                value: _price,
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    _price = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 20.0),
                child: Divider(
                  thickness: 1.0,
                  color: Colors.grey,
                ),
              ),
              _buildNumberSelector(
                label: 'Total Available Seats',
                value: _totalSeats,
                onIncrement: () {
                  setState(() {
                    _totalSeats++;
                  });
                },
                onDecrement: () {
                  if (_totalSeats > 1) {
                    setState(() {
                      _totalSeats--;
                    });
                  }
                },
              ),
            ] else ...[
              _buildNumberSelector(
                label: 'Total Persons',
                value: _totalPersons,
                onIncrement: () {
                  setState(() {
                    _totalPersons++;
                  });
                },
                onDecrement: () {
                  if (_totalPersons > 1) {
                    setState(() {
                      _totalPersons--;
                    });
                  }
                },
              ),
            ],
          ],
        ),
      ),
       actions: [
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
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
    );
  }
}
