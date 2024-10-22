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
                  height: 130,
                  color: Color.fromRGBO(48, 75, 52, 100),
                ),
              ),
              Positioned(
                top: 25,
                left: 0,
                right: 0,
                child: Padding(
                  // Add padding to the AppBar
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0), // Adjust horizontal padding as needed
                  child: AppBar(
                    title: const Text(
                      'Car Pool',
                      style: TextStyle(
                        fontSize: 38,
                        color: Colors.white, // Adjusted font color
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    backgroundColor:
                        Colors.transparent, // Show curved background
                    elevation: 0,
                    actions: [
                      Container(
                        width: 40, // Adjust the width of the circle
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1.5, // Border width
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            padding: EdgeInsets.zero, // Remove default padding
                            icon: const Icon(
                              Icons.filter_alt,
                              size: 25, // Adjusted icon size
                              color: Colors.black,
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => const CarPoolFilter(),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 12), // Spacing between icons
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1.5,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.add,
                              size: 35,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    const CreateNewPostDialog(),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Toggle driver/passenger buttons outside the curved AppBar
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 25.0,
                horizontal: 16.0), // Add horizontal padding for spacing
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start, // Align to the left
              children: [
                Icon(
                  Icons.pin_drop,
                  size: 25, // Adjusted icon size
                  color: Colors.red,
                ),
                Text(
                  ' Your Location : ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Kolej Canselor, UPM',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: DividedButton(
              leftText: 'Driver',
              rightText: 'Passenger',
              onPressed: () {
                setState(() {
                  isDriver = !isDriver; // Toggle state on button press
                });
              },
              leftColor: isDriver ? Colors.black : Colors.grey,
              rightColor: isDriver ? Colors.grey : Colors.black,
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

class DividedButton extends StatelessWidget {
  final String leftText;
  final String rightText;
  final VoidCallback onPressed;
  final Color leftColor;
  final Color rightColor;

  const DividedButton({
    Key? key,
    required this.leftText,
    required this.rightText,
    required this.onPressed,
    this.leftColor = Colors.grey,
    this.rightColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: leftColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                leftText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: rightColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                rightText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for the curved AppBar background
class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(
        0, size.height - 60); // Move to bottom-left with curve start point
    // Bottom-left curve (20px curve)
    path.quadraticBezierTo(0, size.height, 60, size.height);

    path.lineTo(size.width - 60, size.height); // Move to the bottom-right curve
    // Bottom-right curve (20px curve)
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 60);

    path.lineTo(size.width, 0); // Move to the top-right
    path.close(); // Close the path by connecting back to the start (top-left)

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

void main() => runApp(const CarPooling());
