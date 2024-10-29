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
      carPoolList(context, 'Justin Bieber', '31', 'FSKTM, UPM', '17:00',
          'RM2.00', '2', 'male', 'assets/propic_1.jpg', 'driver'),
      carPoolList(context, 'Ariana Grande', '27', 'IOI City Mall', '18:00',
          'RM5.50', '4', 'female', 'assets/propic_2.png', 'driver'),
      carPoolList(context, 'Firdhaus Farmizi ', '23', 'Pavillion KL', '20:30',
          'RM13.00', '3', 'male', 'assets/propic_3.jpg', 'driver'),
    ];
  }

  List<Widget> passengerPosts(BuildContext context) {
    return [
      carPoolList(context, 'Jackie Chan', '65', 'Cheras Traders Square',
          '08:30', 'RM5.00', '1', 'male', 'assets/propic_4.jpg', 'passenger'),
      carPoolList(context, 'Pham Hanni', '20', 'Mid Valley Megamall', '14:45',
          'RM7.50', '2', 'female', 'assets/propic_5.jpg', 'passenger'),
    ];
  }

  Widget carPoolList(
      BuildContext context,
      String name,
      String age,
      String location,
      String time,
      String price,
      String person,
      String gender,
      String imageUrl,
      String userType) {
    int totalPerson = 4;

    return GestureDetector(
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
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
                  time,
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
                          text:
                              location, 
                          style: const TextStyle(
                            fontWeight:
                                FontWeight.bold, 
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
                              ? Colors.green
                              : Colors.red,
                          size: 25,
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 2),
            if (isDriver) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '$person Seats available',
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
                          name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              gender == 'male' ? Icons.male : Icons.female,
                              color:
                                  gender == 'male' ? Colors.blue : Colors.pink,
                              size: 27,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'AGE $age',
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
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
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
                                name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
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
                                    'AGE $age',
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
                    person,
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
