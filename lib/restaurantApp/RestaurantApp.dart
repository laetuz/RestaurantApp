import 'package:flutter/material.dart';
import 'package:restaurant_app/restaurantApp/screen/DetailScreen.dart';
import 'package:restaurant_app/restaurantApp/screen/HomeScreen.dart';

import 'Styles.dart';
void main() => runApp(const RestaurantApp());

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation and Routes",
      theme: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor),
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(elevation: 0),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: secondaryColor,
                  foregroundColor: Colors.white,
              textStyle: const TextStyle()
            )
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: "/",
      routes: {
        "/": (context) =>  const HomeScreen(),
        "/detailScreen": (context) => DetailScreen(
          restaurantId: ModalRoute.of(context)?.settings.arguments as String,)
      },
      // home: const FirstScreen(),
    );
  }
}
