import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String age;
  final String gender;
  final String imageUrl;

  const ChatScreen({super.key, required this.name, required this.age, required this.gender, required this.imageUrl});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<ChatMessage> _messages = [
    ChatMessage(
      message:
          "Hi Justin ! 👋 I'm interested in carpooling with you to FSKTM, UPM at 10:50 AM.",
      isSentByMe: true,
    ),
    ChatMessage(
      message:
          "Hihi 😄 ~ So, will you be picking me up in my area, or should I meet you at a nearby place for pickup?",
      isSentByMe: true,
    ),
    ChatMessage(
      message:
          "Hey yo~!✌️ how should I address you? Maybe you can give me the name of your Taman, and I can pick you up there—it will be easier. 😉",
      isSentByMe: false,
    ),
    ChatMessage(
      message:
          "Is it okay to call you now? I can tell you where I live nearby. 😉",
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

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(message: _controller.text, isSentByMe: true));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 75, 52, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(48, 75, 52, 1),
        leading: IconButton(
          icon: Icon(
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
                  side: BorderSide(
                    color: Colors.black,
                    width: 4.0,
                  ),
                ),
              ),
              child: Text(
                'BOOK A RIDE',
                style: TextStyle(
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
                  backgroundImage: AssetImage('assets/profile_picture.jpg'),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(241, 241, 205, 1),
                      ),
                    ),
                    Text(
                      'AGE ${widget.age}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(241, 241, 205, 1),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.phone,
                    size: 30.0,
                    color: Color.fromRGBO(241, 241, 205, 1),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.video_camera_front,
                    size: 32.0,
                    color: Color.fromRGBO(241, 241, 205, 1),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
                left: 15.0,
                right: 15.0,
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(241, 241, 205, 1),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40.0),
                ),
              ),
              child: ListView.builder(
                itemCount: _messages.length,
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
          Container(
            color: Color.fromRGBO(209, 206, 206, 1),
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
                    icon: Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (value) {
                        _sendMessage();
                      },
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        filled: true,
                        fillColor: Color.fromRGBO(99, 96, 96, 0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 20.0,
                        ),
                        suffixIcon: Padding(
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

class ChatMessage {
  final String? message;
  final bool isSentByMe;
  final bool isVoiceCall;

  ChatMessage({
    this.message,
    required this.isSentByMe,
    this.isVoiceCall = false,
  });
}

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
        constraints: BoxConstraints(
          maxWidth: 270,
        ),
        decoration: BoxDecoration(
          color: isSentByMe
              ? Color.fromRGBO(200, 217, 143, 1)
              : Color.fromRGBO(124, 186, 135, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: isSentByMe ? Radius.circular(15.0) : Radius.circular(0),
            bottomRight:
                isSentByMe ? Radius.circular(0) : Radius.circular(15.0),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}

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
        constraints: BoxConstraints(
          maxWidth: 200,
        ),
        decoration: BoxDecoration(
          color:
              isSentByMe ? Color.fromRGBO(200, 217, 143, 1) : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(6.0),
          color: Color.fromRGBO(229, 229, 171, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.phone_forwarded,
                    color: Colors.black,
                    size: 32,
                  ), // Phone icon
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
