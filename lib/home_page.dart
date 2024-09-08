import 'package:flutter/material.dart';

import 'chat_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 100,
        title: _buildHeader(context),
      ),
      body: Column(
        children: [
          _buildDateSelector(),
          Expanded(child: _buildTaskSection()),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildHeader(BuildContext context) {
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
                icon: const Icon(Icons.message, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChatBoxScreen()));
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Welcome Jamie!",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const Text(
            "Explore Tasks",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return Container(
      height: 200,
      color: Colors.black,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 7, // Example: 7 days
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '14', // Example: Date number
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.blue],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Text(
                    "Wed", // Example: Day name
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTaskSection() {
    List<Map<String, dynamic>> tasks = [
      {
        "title": "Chat Application",
        "subtitle": "Overdue, Mar 13, 2022",
        "progress": 0.7,
        "progressColor": Colors.red,
      },
      {
        "title": "NFT Website",
        "subtitle": "Scheduled, Mar 16, 2022",
        "progress": 0.8,
        "progressColor": Colors.orange,
      },
      {
        "title": "NFT Website",
        "subtitle": "Completing, Mar 16, 2022",
        "progress": 0.98,
        "progressColor": Colors.blue,
      },
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Tasks",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTaskCategoryButton("Left"),
              _buildTaskCategoryButton("Done"),
            ],
          ),
          const SizedBox(height: 16),
          tasks.isNotEmpty
              ? Expanded(child: _buildTaskList(tasks))
              : const Center(child: Text("No tasks available")),
        ],
      ),
    );
  }

  Widget _buildTaskCategoryButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: label == "Left" ? Colors.white : Colors.black,
        backgroundColor: label == "Left" ? Colors.black : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text(label),
    );
  }

  Widget _buildTaskList(List<Map<String, dynamic>> tasks) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return _buildTaskItem(
          task['title'],
          task['subtitle'],
          task['progress'],
          task['progressColor'],
        );
      },
    );
  }

  Widget _buildTaskItem(
      String title, String subtitle, double progress, Color progressColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircularProgressIndicator(
            value: progress,
            color: progressColor,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(subtitle, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const Spacer(),
          const Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/images 1.jpg'),
                radius: 20,
              ),
              SizedBox(width: 8),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/images 1.jpg'),
                radius: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.blue],
        ),
      ),
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(icon: const Icon(Icons.home), onPressed: () {}),
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
            const SizedBox(width: 32), // Space for the floating button
            IconButton(icon: const Icon(Icons.person), onPressed: () {}),
            IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
