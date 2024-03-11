import 'package:flutter/material.dart';

import '../../../component/card/ListTileItem.dart';
import '../../component/card/TileItemReview.dart';
import '../Restaurant.dart';

class HomeScreen extends StatelessWidget {
  // final Restaurant restaurant;

  const HomeScreen({super.key});

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
        )
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString("./assets/restaurant.json"),
        builder: (context, snapshot) {
          List<Restaurant> restaurant = parseRestaurant(snapshot.data);
          return ListView.builder(
              itemCount: restaurant.length,
              itemBuilder: (context, index) {
                var restaurantItem = restaurant[index];
                return TileItemReview(
                  imageUrl:  restaurantItem.pictureId,
                  ctx: context,
                  title: restaurantItem.name,
                  subTitle: restaurantItem.city,
                  review: "${restaurantItem.rating}",
                  onTap: () {
                    Navigator.pushNamed(context, "/detailScreen", arguments: restaurantItem);
                  },
                );
              });
        },
      ),
    );
  }
}
