import 'package:flutter/material.dart';

// ChatScreen widget displaying a chat interface between users.
class ChatScreen extends StatefulWidget {
  final String name; // User's name
  final String age; // User's age
  final String gender; // User's gender
  final String imageUrl; // URL of user's profile image
  final String userType; // Type of user ('driver' or 'passenger')

  const ChatScreen(
      {super.key,
      required this.name,
      required this.age,
      required this.gender,
      required this.imageUrl,
      required this.userType});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  // Initial example messages
  List<ChatMessage> _messages = [
    ChatMessage(
      message: "Hi ! 👋 I'm interested in carpooling with you. 😄",
      isSentByMe: true,
    ),
    ChatMessage(
      message: "Hey yo~!✌️ how should I address you? 😉",
      isSentByMe: false,
    ),
    ChatMessage(
      message:
          "My name is Wendy. Is it okay to call you now? So that we can discuss further more. 😉",
      isSentByMe: true,
    ),
    ChatMessage(
      message: "Sure ~~",
      isSentByMe: false,
    ),
    ChatMessage(
      isVoiceCall: true,
      isSentByMe: true,
    ),
    ChatMessage(
      message: "See you ltr XDD",
      isSentByMe: false,
    ),
  ];

  // Function to send message
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        // Add the message to list and clear input
        _messages.add(ChatMessage(message: _controller.text, isSentByMe: true));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(48, 75, 52, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(48, 75, 52, 1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 35.0,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 13.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 4.0,
                  ),
                ),
              ),
              child: Text(
                widget.userType == 'driver'
                    ? 'BOOK A RIDE'
                    : 'SHARE A RIDE',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 19.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // User profile section
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 30.0,
              left: 15.0,
              right: 5.0,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 45.0,
                  backgroundImage:
                      AssetImage(widget.imageUrl), // User profile image
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name, // Display user name
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(241, 241, 205, 1),
                      ),
                    ),
                    // Display gender icon and age
                    Row(
                      children: [
                        Icon(
                          widget.gender == 'male' ? Icons.male : Icons.female,
                          color: widget.gender == 'male'
                              ? Colors.blue
                              : Colors.pink,
                          size: 21,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'AGE ${widget.age}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(241, 241, 205, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                // Buttons for voice and video call
                IconButton(
                  icon: const Icon(
                    Icons.phone,
                    size: 30.0,
                    color: Color.fromRGBO(241, 241, 205, 1),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.video_camera_front,
                    size: 32.0,
                    color: Color.fromRGBO(241, 241, 205, 1),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // Chat messages section
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
                left: 15.0,
                right: 15.0,
              ),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(241, 241, 205, 1),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40.0),
                ),
              ),
              child: ListView.builder(
                itemCount: _messages.length, // Number of messages to display
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  if (message.isVoiceCall) {
                    return VoiceCallMessage(isSentByMe: message.isSentByMe);
                  } else {
                    return ChatBubble(
                      message: message.message!,
                      isSentByMe: message.isSentByMe,
                    ); 
                  }
                },
              ),
            ),
          ),
          // Message input section
          Container(
            color: const Color.fromRGBO(209, 206, 206, 1),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 5.0,
                right: 5.0,
                top: 12.0,
                bottom: 12.0,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller, // Controller for text input
                      onSubmitted: (value) {
                        _sendMessage();
                      },
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        filled: true,
                        fillColor: const Color.fromRGBO(99, 96, 96, 0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 20.0,
                        ),
                        suffixIcon: const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.mic,
                            color: Colors.black,
                            size: 33,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.black, size: 30),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Model class for chat messages
class ChatMessage {
  final String? message; // Text of the message
  final bool isSentByMe; // Whether the message is sent by the user
  final bool isVoiceCall; // Whether this is a voice call message

  ChatMessage({
    this.message,
    required this.isSentByMe,
    this.isVoiceCall = false,
  });
}

// Widget for displaying a chat message bubble
class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isSentByMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(13.0),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        constraints: const BoxConstraints(
          maxWidth: 270,
        ),
        decoration: BoxDecoration(
          color: isSentByMe
              ? const Color.fromRGBO(200, 217, 143, 1)
              : const Color.fromRGBO(124, 186, 135, 1),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15.0),
            topRight: const Radius.circular(15.0),
            bottomLeft: isSentByMe ? const Radius.circular(15.0) : const Radius.circular(0),
            bottomRight:
                isSentByMe ? const Radius.circular(0) : const Radius.circular(15.0),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}

// Widget to represent a voice call message
class VoiceCallMessage extends StatelessWidget {
  final bool isSentByMe;

  const VoiceCallMessage({super.key, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        constraints: const BoxConstraints(
          maxWidth: 200,
        ),
        decoration: BoxDecoration(
          color:
              isSentByMe ? const Color.fromRGBO(200, 217, 143, 1) : Colors.grey[300],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(6.0),
          color: const Color.fromRGBO(229, 229, 171, 1),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.phone_forwarded,
                    color: Colors.black,
                    size: 32,
                  ),
                ],
              ),
              SizedBox(
                width: 13,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Voice Call',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    '2 sec · You joined',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
