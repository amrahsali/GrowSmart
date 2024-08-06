import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/config.dart';
import '../../../state.dart';

class ChatDetailPage extends StatefulWidget {
  final String driverName;
  final String driverId;
  final String rideId;

  ChatDetailPage({
    required this.driverName,
    required this.driverId,
    required this.rideId,
  });

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final List<Map<String, dynamic>> messages = [];
  TextEditingController _messageController = TextEditingController();


  @override
  void initState() {
    super.initState();
    
  }
  //

  void sendMessage( socketService) {
    String message = _messageController.text;
    if (message.isNotEmpty) {
      socketService.emit('sendMessage', {
        'senderId': profile.value.user?.userId,
        'receiverId': widget.driverId,
        'message': message
      });
      setState(() {
        messages.add({"text": message, "isMe": true});
      });
      _messageController.clear();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final socketService = Provider.of<SocketService>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with NurtureAI"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/health2.svg',
              width: 23.0,
              height: 20.0,
            ),
            onPressed: () {
              // Define your call action or navigation here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isMe = messages[index]['isMe'];
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.black87 : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      messages[index]['text'],
                      style: TextStyle(
                        color: isMe ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type your message here...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.black87,
                  child: IconButton(
                      icon: Icon(Icons.add, color: Colors.white), onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatDetailPage(driverName: '', driverId: '', rideId: '',)),
                    );
                  },
                      //onPressed: (){sendMessage(socketService);}
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
