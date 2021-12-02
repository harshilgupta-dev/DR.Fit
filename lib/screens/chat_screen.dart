import 'package:dr_fit/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../helpers/shared_prefrences.dart';
import 'package:flutter/material.dart';
import '../utils/chat_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;

  final SharedPrefrencesHelper _prefrencesHelper = SharedPrefrencesHelper();

  late final loggedInUser;

  final _firestore = FirebaseFirestore.instance;

  late String messageText;

  final messageTextController = TextEditingController();

  int msgCounter = 0;

  void getData() async {
    msgCounter = await _prefrencesHelper.getIntInPrefrences('msgCounter');
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      // ignore: avoid_print
      print("error 404");
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    messageTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(
              firestore: _firestore,
              loggedInUser: loggedInUser,
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: kShadowColor,
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20),
                              right: Radius.circular(20))),
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          messageText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      getData();

                      setState(() {
                        messageTextController.clear();
                        _firestore.collection('messages').add({
                          'text': messageText,
                          'sender': loggedInUser.email,
                          'msgNumber': msgCounter,
                        });
                        msgCounter++;
                      });
                      _prefrencesHelper.setIntInPrefrences(
                          'msgCounter', msgCounter);
                    },
                    child: Container(
                      height: 50,
                      width: 51,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.lightBlueAccent,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(2, 2),
                                color: Colors.black12,
                                spreadRadius: 3,
                                blurRadius: 3),
                            BoxShadow(
                                offset: Offset(-2, -2),
                                color: Colors.black12,
                                spreadRadius: 3,
                                blurRadius: 3)
                          ]),
                      child: const Center(
                          child: FaIcon(
                        FontAwesomeIcons.paperPlane,
                        color: Colors.black,
                        size: 25,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream(
      {Key? key, required this.firestore, required this.loggedInUser})
      : super(key: key);

  final FirebaseFirestore firestore;
  // ignore: prefer_typing_uninitialized_variables
  final loggedInUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').orderBy('msgNumber').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return Expanded(
          child: ListView(
            reverse: true,
            children:
                snapshot.data!.docs.reversed.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              final message = data['text'];
              final sender = data['sender'];

              final currentUser = loggedInUser.email;

              return MessageBubble(
                  message: message,
                  sender: sender,
                  isMe: currentUser == sender);
            }).toList(),
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final message;
  // ignore: prefer_typing_uninitialized_variables
  final sender;
  final bool isMe;

  const MessageBubble(
      {Key? key,
      required this.message,
      required this.sender,
      required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(fontSize: 12.0, color: Colors.black54),
          ),
          Material(
            elevation: 5.0,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0))
                : const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0)),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20.0),
              child: Text(
                message,
                style: TextStyle(
                    color: isMe ? Colors.white : Colors.black, fontSize: 15.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
