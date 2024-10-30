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
  bool isDriver = true; // Flag to check if the user is a driver or passenger

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
                      // Filter button
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
                               // Show the filter dialog when pressed
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
                      // New post button
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
                              // Show the new post dialog when pressed
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
          // Display user location
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
                  maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                     
                  ),
                ),
                Text(
                  'Kolej Canselor, UPM', // Example current location
                  maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          // Toggle button for Driver/Passenger selection
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: DividedButton(
              leftText: 'Driver',
              rightText: 'Passenger',
              onPressed: () {
                // Toggle between Driver and Passenger
                setState(() {
                  isDriver = !isDriver; // Change the state
                });
              },
              // Change color based on selection
              leftColor: isDriver ? Colors.black : Colors.grey,
              rightColor: isDriver ? Colors.grey : Colors.black,
            ),
          ),
          // Section title for nearby people
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'People Nearby You',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          // Display the list of posts based on Driver/Passenger selection
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

  // Returns a list of driver posts
  List<Widget> driverPosts(BuildContext context) {
    return [
      // Sample driver posts with details
      carPoolList(context, 'Justin Bieber', '31', 'FSKTM, UPM', '17:00',
          'RM2.00', '2', 'male', 'assets/propic_1.jpg', 'driver'),
      carPoolList(context, 'Ariana Grande', '27', 'IOI City Mall', '18:00',
          'RM5.50', '4', 'female', 'assets/propic_2.png', 'driver'),
      carPoolList(context, 'Firdhaus Farmizi ', '23', 'Pavillion KL', '20:30',
          'RM13.00', '3', 'male', 'assets/propic_3.jpg', 'driver'),
    ];
  }

  // Returns a list of passenger posts
  List<Widget> passengerPosts(BuildContext context) {
    return [
      // Sample passenger posts with details
      carPoolList(context, 'Jackie Chan', '65', 'Cheras Traders Square',
          '08:30', 'RM5.00', '1', 'male', 'assets/propic_4.jpg', 'passenger'),
      carPoolList(context, 'Pham Hanni', '20', 'Mid Valley Megamall', '14:45',
          'RM7.50', '2', 'female', 'assets/propic_5.jpg', 'passenger'),
    ];
  }

  // Widget that displays a car pool listing
  Widget carPoolList(
      BuildContext context,
      String name, // Name of the driver/passenger
      String age, // Age of the driver/passenger
      String location, // Destination location
      String time, // Departure time
      String price, // Price per person
      String person, // Number of persons
      String gender, // Gender of the driver/passenger
      String imageUrl, // URL for the profile image
      String userType // Type of user (driver or passenger)
      ) {
    int totalPerson = 4; // Total number of seats in the car

    return GestureDetector(
      // Navigate to ChatScreen when tapped
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
                name: name,
                age: age,
                gender: gender,
                imageUrl: imageUrl,
                userType: userType),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(241, 241, 205, 1),
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  time, // Display the departure time
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(width: 7),
                const Icon(Icons.circle, size: 11, color: Colors.red),
                const SizedBox(width: 7),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'to ',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: location, // Display the destination
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                if (isDriver) ...[
                  Row(
                    children: List.generate(
                      totalPerson,
                      (index) {
                        return Icon(
                          Icons.airline_seat_recline_normal_sharp,
                          color: index < int.parse(person)
                              ? Colors.green // Seat available
                              : Colors.red, // Seat taken
                          size: 25,
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 2),
            // Display additional details if the user is a driver
            if (isDriver) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '$person Seats available', // Number of seats available
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 13,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  // Profile image of the driver
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        imageUrl,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name, // Driver's name
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            // Driver's gender
                            Icon(
                              gender == 'male' ? Icons.male : Icons.female,
                              color:
                                  gender == 'male' ? Colors.blue : Colors.pink,
                              size: 27,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'AGE $age', // Display age (driver or passenger)
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(''),
                      Text(''),
                      Text(price, style: const TextStyle(fontSize: 18)),
                      Text(
                        "Price per person",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ] else ...[
              // Render details if the user is a passenger
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        // Profile image of the passenger
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              imageUrl,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name, // Passenger's name
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  // Passenger's gender
                                  Icon(
                                    gender == 'male'
                                        ? Icons.male
                                        : Icons.female,
                                    color: gender == 'male'
                                        ? Colors.blue
                                        : Colors.pink,
                                    size: 27,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'AGE $age', // Display age
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    person, // Display the number of persons for the ride
                    style: const TextStyle(fontSize: 17),
                  ),
                  Icon(Icons.person, size: 35, color: Colors.black),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

//divide button into two parts
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
    this.leftColor = Colors.transparent,
    this.rightColor = Colors.transparent,
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
//build specific shape for an AppBar
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
    return false;//indicate that the clipper does not need to reclip when the widget rebuilds
  }
}

