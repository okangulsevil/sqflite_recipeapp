import 'package:flutter/material.dart';
import 'package:recipebook/consts/my_icons.dart';
import 'package:recipebook/screens/home_screen.dart';
import 'package:recipebook/screens/add_screen.dart';
import 'package:recipebook/screens/user_info.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': MyHomePage(),
      },
      {
        'page': RecipeAddScreen(),
      },
      {
        'page': UserInfo(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 1.05,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Colors.white,
              unselectedItemColor: Theme.of(context).textSelectionColor,
              selectedItemColor: Theme.of(context).primaryColor,
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.home),
                  title: Text("Home"),
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  title: Text("Add Recipe"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.user),
                  title: Text("User"),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FloatingActionButton(
            hoverElevation: 10,
            splashColor: Colors.grey,
            tooltip: 'Add',
            elevation: 4,
            child: Icon(MyAppIcons.addRecipe),
            onPressed: () => setState(() {
                  _selectedPageIndex = 1;
                })),
      ),
    );
  }
}
