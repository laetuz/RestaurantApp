import 'package:flutter/material.dart';
import 'package:restaurant_app/restaurantApp/data/api/ApiService.dart';

import '../../component/card/TileItemReview.dart';
import '../model/RestaurantHeader.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<RestaurantHeader> restaurantHeader;

  @override
  void initState() {
    super.initState();
    restaurantHeader = ApiService().getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Restaurant"),
            Text("Recommendation restaurant for you!", style: TextStyle(fontSize: 14),)
          ],
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, "/searchScreen");
          }, icon: Icon(Icons.search))
        ],
      ),
      body: FutureBuilder<RestaurantHeader>(
        future: restaurantHeader,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}"); // Handle error message (Widget)
          } else if (snapshot.hasData) {
            final restaurants = snapshot.data!.restaurants; // Access restaurants list
            // Display restaurant data here (loop through restaurants) - This should return a Widget
            return ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  var restaurantItem = restaurants[index];
                  return TileItemReview(
                    imageUrl: "https://restaurant-api.dicoding.dev/images/medium/${restaurantItem.pictureId}",
                    ctx: context,
                    title: restaurantItem.name,
                    subTitle: restaurantItem.city,
                    review: "${restaurantItem.rating}",
                    onTap: () {
                      Navigator.pushNamed(context, "/detailScreen", arguments: restaurantItem.id);
                    },
                  );
                });
          } else {
            return CircularProgressIndicator(); // Show loading indicator (Widget)
          }
        },
      )
    );
  }
}
