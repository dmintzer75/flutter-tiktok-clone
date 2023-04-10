import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/shared/constants.dart';

import 'package:tiktok_clone/theme/custom_theme.dart';
import 'package:tiktok_clone/views/screens/auth/login_screen.dart';
import '../widgets/custom_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sd'),
        leading: IconButton.outlined(
          onPressed: () {
            Get.to(LoginScreen());
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Pallete.backgroundColorDarker,
        selectedItemColor: Pallete.mainColor,
        unselectedItemColor: Pallete.mainFontColor.withOpacity(0.7),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 25), label: 'Search'),
          BottomNavigationBarItem(icon: CustomIcon(), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message, size: 25), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 25), label: 'Profile'),
        ],
      ),
      body: Center(child: pages[pageIndex]),
    );
  }
}
