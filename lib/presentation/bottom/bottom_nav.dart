import 'package:flutter/material.dart';
import 'package:news_app/presentation/home/home_screen.dart';
import 'package:news_app/presentation/bottom/widgets/custom_appbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  // List of widgets corresponding to each tab
  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(), // Ensure this is correctly applied
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: const Color.fromARGB(255, 15, 15, 15),
        selectedItemColor: Colors.redAccent,
        iconSize: 35,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.language_sharp),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Live Tv',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Topics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// Sample pages for demonstration

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Live Tv', style: TextStyle(fontSize: 24)),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Toppis', style: TextStyle(fontSize: 24)),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings', style: TextStyle(fontSize: 24)),
    );
  }
}
