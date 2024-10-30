import 'package:flutter/material.dart';
import 'package:hackathonx/pages/carpool/carpool.dart';

// Car Pool filter options
class CarPoolFilter extends StatefulWidget {
  final double price;
  final String? location;
  final DateTime? date;

  CarPoolFilter({
    required this.price,
    required this.location,
    required this.date,
  });

  @override
  _CarPoolFilterState createState() => _CarPoolFilterState();
}

class _CarPoolFilterState extends State<CarPoolFilter> {
  // Declare state variables to store the selected filter values
  late double _price;
  String? _location;
  DateTime? _date;
  TimeOfDay? _time;
  bool isDriver = true;
  String? _gender;

  @override
  void initState() {
    super.initState();
    _price = widget.price;
    _location = widget.location;
    _date = widget.date;
  }

  // Method to show date picker and set selected date
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date ?? DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _date = picked; // Update date if a valid date was picked
      });
    }
  }

  // Method to show time picker and set selected time
  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time ?? TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _time = picked; // Update time if a valid time was picked
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(10.0),
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      title: const Text(
        'Car Pool Filters',
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
            // Toggle button for selecting between 'Driver' and 'Passenger'
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
            // Location dropdown to select a destination
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
                value: _location,
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
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(top: 0, bottom: 20.0),
              child: Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
            ),
            // Date selection button
            const Text(
              'Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: _selectDate,
              child: Text(
                _date != null
                    ? '${_date!.toLocal().toString().split(' ')[0]}'
                    : 'Select date',
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
            // Time selection button
            const Text(
              'Time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: _selectTime,
              child: Text(
                _time != null ? '${_time!.format(context)}' : 'Select time',
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
            // Price selection with a slider
            Text(
              'Price: \RM ${_price.toStringAsFixed(2)}',
              style: const TextStyle(
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
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(top: 0, bottom: 20.0),
              child: Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
            ),
            // Gender preference selection with icons
            const Text(
              'Gender Preference',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Male selection
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _gender = 'Male';
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.male,
                        color: _gender == 'Male' ? Colors.blue : Colors.grey,
                        size: 40,
                      ),
                      Text(
                        'Male',
                        style: TextStyle(
                          color: _gender == 'Male' ? Colors.blue : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                // Female selection
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _gender = 'Female';
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.female,
                        color: _gender == 'Female' ? Colors.pink : Colors.grey,
                        size: 40,
                      ),
                      Text(
                        'Female',
                        style: TextStyle(
                          color:
                              _gender == 'Female' ? Colors.pink : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(top: 0, bottom: 20.0),
              child: Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      // Actions at the bottom of the dialog: Cancel and Done buttons
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              child: const Text('CANCLE'),
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
              child: const Text('DONE'),
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
