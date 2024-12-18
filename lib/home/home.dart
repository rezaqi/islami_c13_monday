import 'package:flutter/material.dart';
import 'package:islami_c13_monday/core/class/images.dart';
import 'package:islami_c13_monday/home/tabs/ahadeth_tab.dart';
import 'package:islami_c13_monday/home/tabs/quran_tab.dart';
import 'package:islami_c13_monday/home/tabs/radio.dart';
import 'package:islami_c13_monday/home/tabs/sebha_tab.dart';
import 'package:islami_c13_monday/home/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                "assets/images/${getBackgroundImageName(selectedIndex)}.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            backgroundColor: const Color(0xFFE2BE7F),
            showUnselectedLabels: false,
            showSelectedLabels: true,
            unselectedItemColor: const Color(0xFF202020),
            selectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: _buildNavItem(0, "quran"), label: "Quran"),
              BottomNavigationBarItem(
                  icon: _buildNavItem(1, "ahadeth"), label: "Ahadeth"),
              BottomNavigationBarItem(
                  icon: _buildNavItem(2, "sebha"), label: "Sebha"),
              BottomNavigationBarItem(
                  icon: _buildNavItem(3, "ic_radio"), label: "Radio"),
              BottomNavigationBarItem(
                  icon: _buildNavItem(4, "dates"), label: "Time"),
            ]),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [Image.asset(AppImages.islami), tabs[selectedIndex]],
        ),
      ),
    );
  }

  List<Widget> tabs = [
    const QuranTab(),
    const AhadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const TimeTab(),
  ];

  String getBackgroundImageName(index) {
    switch (index) {
      case 0:
        return "home_bg";
      case 1:
        return "ahadeth_bg";
      case 2:
        return "sebha_bg";
      case 3:
        return "radio_bg";
      default:
        return "home_bg";
    }
  }

  Widget _buildNavItem(int index, String imageName) {
    return selectedIndex == index
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0x99202020),
              borderRadius: BorderRadius.circular(66),
            ),
            child: ImageIcon(
              AssetImage("assets/images/$imageName.png"),
            ))
        : ImageIcon(
            AssetImage("assets/images/$imageName.png"),
          );
  }
}
