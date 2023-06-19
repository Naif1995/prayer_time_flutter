import 'package:flutter/material.dart';
import 'package:prayer_time_app/screen/PrayerTime.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; //New

  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.call,
      size: 150,
    ),
    ImageIcon(
      AssetImage("assets/prayer_icon.png"),
      size: 24,
    ),
    ParayerTime()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prayer Time"),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,

        // child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        // selectedFontSize: 20,
        // selectedIconTheme: IconThemeData(color: Theme.of(context).cardColor, size: 40),
        // selectedItemColor: Colors.amberAccent,
        // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/prayer_icon.png"),
              ),
              label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
