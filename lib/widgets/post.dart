import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  Post(
      {required this.title,
      required this.content,
      required this.profilePic,
      required this.profileName,
      super.key});

  String title;
  String content;
  String profilePic;
  String profileName;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(blurRadius: 2, offset: Offset(0, 1)),
            ]),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(widget.content),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(
                        widget.profilePic,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(widget.profileName)
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_outline),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.comment)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
