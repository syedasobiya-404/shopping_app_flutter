import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/screens/home_screen.dart';

void main() {
  runApp(
    ShoppingApp(),
  );
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shopping App",
        home: HomeScreen(),
        // Theming
        theme: ThemeData(
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(
            primary: Color.fromRGBO(254, 206, 1, 1),
            seedColor: Color.fromRGBO(254, 206, 1, 1),
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            bodySmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
