import 'package:flutter/material.dart';
import 'package:hackathonx/pages/carpool_chat.dart';
import 'package:hackathonx/pages/carpool_filter.dart';
import 'package:hackathonx/pages/carpool_newpost.dart';

class CarPooling extends StatelessWidget {
  const CarPooling({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CarPoolingHome(),
    );
  }
}

class CarPoolingHome extends StatefulWidget {
  const CarPoolingHome({super.key});

  @override
  _CarPoolingHomeState createState() => _CarPoolingHomeState();
}

class _CarPoolingHomeState extends State<CarPoolingHome> {
  bool isDriver = true; // Toggle between driver and passenger

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // Custom shape for curved AppBar background
              ClipPath(
                clipper: AppBarClipper(),
                child: Container(
                  height: 200,
                  color: Colors.blue,
                ),
              ),
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: AppBar(
                  title: const Text('Car Pool'),
                  backgroundColor: Colors.transparent, // Show curved background
                  elevation: 0,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.filter_alt),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => const CarPoolFilter(), // CarPool Filter Modal
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const CreateNewPostDialog(), // Create New Post Dialog
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Toggle driver/passenger buttons outside the curved AppBar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isDriver = true;
                    });
                  },
                  child: const Text('Driver'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isDriver = false;
                    });
                  },
                  child: const Text('Passenger'),
                ),
              ],
            ),
          ),
          // Display carpool list based on selection
          Expanded(
            child: ListView(
              children: isDriver
                  ? driverPosts(context)
                  : passengerPosts(context), // Call appropriate list function
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> driverPosts(BuildContext context) {
    return [
      carPoolTile(
        context,
        'Justin Bieber',
        'FSKTM, UPM',
        '17:00',
        'RM0.00',
        '2',
        'Driver',
      ),
      carPoolTile(
        context,
        'Ariana Grande',
        'IOI City Mall',
        '18:00',
        'RM5.00',
        '5',
        'Driver',
      ),
    ];
  }

  List<Widget> passengerPosts(BuildContext context) {
    return [
      carPoolTile(
        context,
        'Jackie Chan',
        'Cheras Traders Square',
        '08:30',
        'RM5.00',
        '1',
        'Passenger',
      ),
      carPoolTile(
        context,
        'Nicol David',
        'TBS',
        '14:45',
        'RM7.50',
        '1',
        'Passenger',
      ),
    ];
  }

  Widget carPoolTile(BuildContext context, String name, String location,
      String time, String price, String seats, String type) {
    return ListTile(
      leading: CircleAvatar(child: Text(name[0])),
      title: Text(name),
      subtitle: Text('$location | $time | $price'),
      trailing: Column(
        children: [
          Text('$seats seats'),
          Text(type),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen(name: name)),
        );
      },
    );
  }
}

// Custom Clipper for the curved AppBar background
class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

void main() => runApp(const CarPooling());
