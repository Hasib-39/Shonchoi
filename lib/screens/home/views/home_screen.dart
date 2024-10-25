import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shonchoi/screens/add_expense/views/add_expense.dart';
import 'package:shonchoi/screens/home/views/main_screen.dart';

import '../../stat/stats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int index = 0;
  late Color selectedColor = Colors.blue;
  Color unselectedColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30)
        ),
        child : BottomNavigationBar(
          onTap: (value){
            setState(() {
              index = value;
            });
          },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 3,

            items: [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    CupertinoIcons.home,
                    color: index == 0 ? selectedColor:unselectedColor,
                  )
              ),
              BottomNavigationBarItem(
                label: 'Stats',
                icon: Icon(
                  CupertinoIcons.graph_square_fill,
                  color: index != 0 ? selectedColor:unselectedColor,
                ),
              )
            ]
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const AddExpense(),
              ),
            );
          },
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
