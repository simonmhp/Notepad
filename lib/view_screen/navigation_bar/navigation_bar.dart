import 'package:flutter/material.dart';
import 'package:notepad/constant/colors.dart';
import 'package:notepad/view_screen/profile_screen/profile_Screen.dart';
import '../Add_Note_Screen/add_screen.dart';
import '../home_screen/home_screen.dart';

class Navigation_Var extends StatefulWidget {
  const Navigation_Var({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Navigation_Var> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    AddScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting, // Shifting
        selectedItemColor: AppColor.whiteall,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: AppColor.navigationbarcolor,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add ',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
