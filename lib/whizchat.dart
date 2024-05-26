import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home.dart';

class WhizChatPage extends StatefulWidget {
  @override
  _WhizChatPageState createState() => _WhizChatPageState();
}

class _WhizChatPageState extends State<WhizChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _getInitialGreeting();
  }

  Future<void> _getInitialGreeting() async {
    setState(() {
      _messages.add({
        'text': 'Heyy, it\'s your Virtual Coach (Whiz) how can I help you? Would you like a prediction of your next big lift!',
        'type': 'bot'
      });
    });
    _scrollToBottom();
  }

  Future<void> _sendMessage(String message) async {
    setState(() {
      _messages.add({'text': message, 'type': 'user'});
      _isTyping = true;
    });
    _controller.clear();
    _scrollToBottom();

    String query;
    if (message.toLowerCase().contains('yes')) {
      query = "Throughout the last month I lifted in order 30kgs, 32 kgs, 34 kgs, 36 kgs, 38 kgs, based on these numbers what do you predict I'll be able to lift and just give me the final answer and after how many days and due to what and what else would I be able to lift";
    } else {
      query = message;
    }

    final url = Uri.parse('http://127.0.0.1:5000/generate');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'query': query}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _messages.add({'text': data['response'], 'type': 'bot'});
        _isTyping = false;
      });
    } else {
      setState(() {
        _messages.add({'text': 'Error: ${response.statusCode}', 'type': 'bot'});
        _isTyping = false;
      });
    }
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.minScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFF1C1A26),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1A26),
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage())
            );
          },
        ),
        title: Column(
          children: [
            SizedBox(height: 10),
            Icon(
              Icons.computer,
              color: Colors.purple,
              size: 30,
            ),
            SizedBox(height: 5),
            Text(
              'Whiz Chat',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        centerTitle: true,
        toolbarHeight: 100, // Increased height
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, -3),
                        ),
                      ],
                      color: Colors.black.withOpacity(0.2), // Adjust opacity
                      borderRadius: BorderRadius.circular(80.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'), // Adjust path as necessary
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Color(0xFF1C1A26).withOpacity(0.6),
                          BlendMode.dstATop,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: _isTyping ? 30.0 : 0),
                  child: ListView.builder(
                    controller: _scrollController,
                    reverse: true,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[_messages.length - 1 - index];
                      final isUser = message['type'] == 'user';
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                        child: Align(
                          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                            decoration: BoxDecoration(
                              color: isUser ? Colors.purple : Colors.grey[800],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              message['text']!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (_isTyping)
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                      child: Row(
                        children: [
                          Text(
                            'Whiz is typing...',
                            style: TextStyle(color: Colors.blue[100]),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF2C2C2E),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 22.5),
                              hintText: 'Enter your message..',
                              hintStyle: TextStyle(color: Colors.white70),
                              border: InputBorder.none,
                            ),
                            onSubmitted: (value) {
                              if (value.isNotEmpty) {
                                _sendMessage(value);
                              }
                            },
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          icon: Icon(Icons.send, color: Colors.purple),
                          onPressed: () {
                            final message = _controller.text;
                            if (message.isNotEmpty) {
                              _sendMessage(message);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
