import 'package:flutter/material.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/products_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  int selectedPage = 0;

  List<Widget> pages = [ProductsList(), CartScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: selectedPage == 0 ? ProductsList() : CartScreen(),
      // body: pages[selectedPage],
      body: IndexedStack(
        index: selectedPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: (value) {
          selectedPage = value;
          setState(() {});
        },
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
