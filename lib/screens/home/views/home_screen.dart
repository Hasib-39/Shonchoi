import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shonchoi/screens/home/views/main_screen.dart';

import '../../stat/stats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  var widgetList = {
    const MainScreen(),
    const StatScreen(),
  };

  int index = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30)
        ),
        child : BottomNavigationBar(
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 3,

            items: const [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(CupertinoIcons.home)
              ),
              BottomNavigationBarItem(
                label: 'Stats',
                icon: Icon(CupertinoIcons.graph_square_fill),
              )
            ]
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
          shape: const CircleBorder(),
          child:Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.tertiary,
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.primary,
                  ],
                transform: const GradientRotation(pi / 4),
              )
            ),
            child: const Icon(
              CupertinoIcons.add,
            ),
          ),
      ),
      body: index == 0
      ? const MainScreen()
      : const StatScreen(),
    );
  }
}
