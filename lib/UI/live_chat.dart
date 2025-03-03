import 'package:flutter/material.dart';

// Live Chat System
class LiveChatPage extends StatefulWidget {
  const LiveChatPage({super.key});

  @override
  LiveChatPageState createState() => LiveChatPageState();
}

class LiveChatPageState extends State<LiveChatPage> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;

    setState(() {
      messages.add({'text': message, 'isUser': true});
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        messages.add({'text': _getBotResponse(message), 'isUser': false});
      });
      _scrollToBottom();
    });

    _scrollToBottom();
    _messageController.clear();
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  String _getBotResponse(String userMessage) {
    if (userMessage.toLowerCase().contains('hello')) {
      return 'Hello! How can I assist you today? 😊';
    } else if (userMessage.toLowerCase().contains('tarot')) {
      return 'I can guide you with Tarot Readings! Ask me anything.';
    } else if (userMessage.toLowerCase().contains('horoscope')) {
      return 'Looking for your daily horoscope? Let me know your zodiac sign!';
    } else {
      return 'I\'m here to help! Ask me about Tarot, Horoscopes, or anything else.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.all(16),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              bool isUser = messages[index]['isUser'];
              return Align(
                alignment:
                    isUser ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isUser ? Colors.purple : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    messages[index]['text'],
                    style: TextStyle(
                      color: isUser ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Type your message...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send, color: Colors.purple),
                onPressed: () => _sendMessage(_messageController.text),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


// To make your Flutter Live Chat System an actual Live Chat Support, 
//you need to integrate a backend that can handle real-time communication 
//between users and support agents. Here are the steps to achieve that:
// Choose a Backend for Real-Time Messaging
// To enable live messaging, you need a real-time backend service.
//Some common options include:
// - Firebase Firestore (Easy to integrate, real-time sync)
// - Socket.IO with Node.js (More control over chat logic)
// - Supabase (PostgreSQL with real-time features)
// - Stream Chat API (Paid, but powerful)
// - Pusher (Real-time WebSockets)