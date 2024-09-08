import 'package:flutter/material.dart';

class ChatBoxScreen extends StatelessWidget {
  const ChatBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            _buildHeader(),
            const SizedBox(height: 20),
            _buildOnlineMembers(),
            const SizedBox(height: 20),
            _buildRecentChats(),
          ],
        ),
      ),
    );
  }

  // Header Section
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/images 1.jpg'),
              ),
              IconButton(
                icon: const Icon(Icons.message, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Welcome Jamie!",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          const Text(
            "Explore Tasks",
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(height: 10),
          const Text(
            "Online Members",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  // Online Members Section
  Widget _buildOnlineMembers() {
    List<Map<String, dynamic>> members = [
      {"name": "Chad", "image": "assets/chad.jpg", "isOnline": true},
      {"name": "Matt", "image": "assets/matt.jpg", "isOnline": true},
      {"name": "Julie", "image": "assets/julie.jpg", "isOnline": true},
      {"name": "Yuri", "image": "assets/yuri.jpg", "isOnline": true},
    ];

    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: members.length + 1, // Including "Add Chat"
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildAddChatButton();
          } else {
            final member = members[index - 1];
            return _buildOnlineMember(
                member['name'], member['image'], member['isOnline']);
          }
        },
      ),
    );
  }

  Widget _buildAddChatButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient:
              const LinearGradient(colors: [Colors.purple, Colors.blue]),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
          const SizedBox(height: 8),
          const Text("Add Chat", style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildOnlineMember(String name, String imagePath, bool isOnline) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/images 1.jpg'),
              ),
              if (isOnline)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(7.5),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  // Recent Chat Section
  Widget _buildRecentChats() {
    List<Map<String, dynamic>> chats = [
      {
        "name": "Chat Boldwick",
        "message": "Sending the file right now",
        "time": "20 min",
        "avatar": "assets/chat_boldwick.jpg"
      },
      {
        "name": "Yuri Lorental",
        "message": "Can you confirm deadline?",
        "time": "20 min",
        "avatar": "assets/yuri.jpg"
      },
      {
        "name": "Julie Woodland",
        "message": "I haven't completed the work.",
        "time": "20 min",
        "avatar": "assets/julie.jpg"
      },
      {
        "name": "Erica Yaeger",
        "message": "Voice Message (0:23)",
        "time": "20 min",
        "avatar": "assets/erica.jpg"
      },
      {
        "name": "Jung Taekwoon",
        "message": "Hello! How is the progress?",
        "time": "20 min",
        "avatar": "assets/jung.jpg"
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recent Chat",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              _buildArchiveChatButton(),
            ],
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chat = chats[index];
              return _buildChatItem(chat['name'], chat['message'],
                  chat['time'], chat['avatar']);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildArchiveChatButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Colors.purple, Colors.blue]),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Text(
        "Archive Chat",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildChatItem(
      String name, String message, String time, String avatarPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/images 1.jpg'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Text(message, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          Text(time, style: const TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}
