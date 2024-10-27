import 'package:flutter/material.dart';

class GreenConnectCommunity extends StatefulWidget {
  const GreenConnectCommunity({super.key});

  @override
  State<GreenConnectCommunity> createState() => _GreenConnectCommunityState();
}

class _GreenConnectCommunityState extends State<GreenConnectCommunity> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/background1.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.62,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(blurRadius: 2, offset: Offset(0, 1)),
                        ]),
                    child: Column(
                      children: [
                        Text('🗑️ Local Waste Disposal Guidelines 🗑️'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                              'Recycling Days: Every Tuesday and Thursday. Make sure bins are out by 7 AM!\n What\’s Accepted?: Recycle plastics (#1-2), paper, cardboard, aluminum, and glass. Please, no plastic bags or... '),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundImage: AssetImage(
                                    'assets/labubu.jpg',
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Labubu')
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_outline),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.comment)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Positioned(
        top: 30,
        // bottom: 100,
        right: 40,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    ]);
  }
}
