import 'package:flutter/material.dart';

// Stateful widget `Post` represents a social media post with title, content, profile picture, 
// profile name, and interactive like and comment buttons.
class Post extends StatefulWidget {
  // Post properties: title, content, profile picture path, and profile name.
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
  bool isLike = false;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding around the entire post widget for spacing
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(blurRadius: 2, offset: Offset(0, 1)),
            ]),
            // Column to structure the post's content in vertical layout
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
                // Row for like and comment icons
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.isLike = !widget.isLike; // Toggle like status and update UI
                        });
                      },
                      icon: widget.isLike
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_outline),
                    ),
                    // Comment button with IconButton widget
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
