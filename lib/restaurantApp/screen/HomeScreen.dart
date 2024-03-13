import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/restaurantApp/data/controller/HomeController.dart';
import 'package:restaurant_app/restaurantApp/data/controller/LoadingState.dart';

import '../../component/card/TileItemReview.dart';
import '../model/RestaurantHeader.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<RestaurantHeader> restaurantHeader;
  final HomeController _homeController = Get.put(HomeController());
  final LoadingState _loadingState = Get.put(LoadingState());

  @override
  void initState() {
    super.initState();
    _homeController.fetchRestaurantHeader();
  }

  @override
  Widget build(BuildContext context) {
    print("neotica type: ${_homeController.errorMessage.value}");

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
      body: Obx(
          ()  => _loadingState.loading.value
              ? const Center(child: CircularProgressIndicator(color: Colors.black))
           : _homeController.errorMessage.value == null ? _widgetMain() : const Center(child: Text("Sorry, connection problem.", style: TextStyle(color: Colors.red),)) /*_homeController.restaurantHeader.value == null ? const Center(child: Text("Sorry, connection error."),) :*/
      )
    );
  }

  Widget _widgetMain(){

    if (_homeController.restaurantHeader.value == null) {
              return Center(child: CircularProgressIndicator(color: Colors.black)); //Text("restarantheader.value_: ${_homeController.restaurantHeader.value}");
            } else
            if (_homeController.restaurantHeader.value!.restaurants.isEmpty) {
              return Center(
                child: Text("No restaurants available"),
              );
            } else {
              return ListView.builder(
                itemCount: _homeController.restaurantHeader.value!.restaurants
                    .length,
                itemBuilder: (context, index) {
                  var restaurantItem = _homeController.restaurantHeader.value!
                      .restaurants[index];
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
                },
              );
            }
  }
}
