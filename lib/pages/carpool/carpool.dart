import 'package:flutter/material.dart';
import 'package:hackathonx/pages/carpool/carpool_chat.dart';
import 'package:hackathonx/pages/carpool/carpool_filter.dart';
import 'package:hackathonx/pages/carpool/carpool_newpost.dart';

class CarPooling extends StatefulWidget {
  const CarPooling({super.key});

  @override
  _CarPoolingState createState() => _CarPoolingState();
}

class _CarPoolingState extends State<CarPooling> {
  bool isDriver = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: AppBarClipper(),
                child: Container(
                  height: 130,
                  color: Color.fromRGBO(48, 75, 52, 1),
                ),
              ),
              Positioned(
                top: 25,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: AppBar(
                    title: const Text(
                      'Car Pool',
                      style: TextStyle(
                        fontSize: 38,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    actions: [
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
                              Icons.filter_alt,
                              size: 25,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                  ),
                                  child: CarPoolFilter(
                                    price: 0,
                                    location: null,
                                    date: null,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
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
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.pin_drop,
                  size: 25,
                  color: Colors.red,
                ),
                Text(
                  ' Your Location : ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Kolej Canselor, UPM',
                  style: TextStyle(
                    fontSize: 16,
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
                  isDriver = !isDriver;
                });
              },
              leftColor: isDriver ? Colors.black : Colors.grey,
              rightColor: isDriver ? Colors.grey : Colors.black,
            ),
          ),
          Expanded(
            child: ListView(
              children:
                  isDriver ? driverPosts(context) : passengerPosts(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> driverPosts(BuildContext context) {
    return [
      carPoolList(
        context,
        'Justin Bieber',
        '28',
        'FSKTM, UPM',
        '17:00',
        'RM0.00',
        '2',
        'Driver',
      ),
      carPoolList(
        context,
        'Ariana Grande',
        '23',
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
      carPoolList(
        context,
        'Jackie Chan',
        '65',
        'Cheras Traders Square',
        '08:30',
        'RM5.00',
        '1',
        'Passenger',
      ),
      carPoolList(
        context,
        'Nicol David',
        '20',
        'TBS',
        '14:45',
        'RM7.50',
        '1',
        'Passenger',
      ),
    ];
  }

  Widget carPoolList(BuildContext context, String name, String age,
    String location, String time, String price, String seats, String type) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0), // Add some margin
    padding: const EdgeInsets.all(18.0), // Add some padding
    decoration: BoxDecoration(
      color: Color.fromRGBO(241, 241, 205, 1),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(width: 7),
            const Icon(Icons.circle, size: 11, color: Colors.red),
            const SizedBox(width: 7),
            Expanded(
              child: Text(
                location,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text('$location | $time | $price'),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$seats seats'),
            Text(type),
          ],
        ),
      ],
    ),
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

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);

    path.quadraticBezierTo(0, size.height, 60, size.height);

    path.lineTo(size.width - 60, size.height);

    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 60);

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
