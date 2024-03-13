import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/restaurantApp/data/api/ApiService.dart';
import 'package:restaurant_app/restaurantApp/data/controller/SearchController.dart';
import 'package:restaurant_app/restaurantApp/model/RestaurantSearch.dart';

import '../../component/card/TileItemReview.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<RestaurantSearch> searchQuery;

  SearchStateController searchState = Get.put(SearchStateController());

  @override
  void initState() {
    super.initState();
    searchQuery = ApiService().getSearch(searchState.query.value);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Search"),
        ),
        body: FutureBuilder<RestaurantSearch>(
            future: searchQuery,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                if (snapshot.error.runtimeType.toString() == "_ClientSocketException") {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Device is offline. Please turn on Internet connection.", style: TextStyle(color: Colors.red),),
                    ),
                  );
                } else {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Device is offline. Please turn on Internet connection.", style: TextStyle(color: Colors.red),),
                    ),
                  );
                }
              } else if (snapshot.hasData) {
                final restaurants = snapshot.data!.restaurants;
                print("search neo: $restaurants");
                // Display restaurant data here (loop through restaurants) - This should return a Widget
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: TextField(
                        cursorColor: Colors.black,
                        autofocus: true,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40)),
                            hintText: "Tulis nama kafe.",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40))),
                        onChanged: (String value) {
                          setState(() {
                            searchState.query.value = value;
                            print("searchsstate" + searchState.query.value);
                            searchQuery = ApiService().getSearch(searchState.query.value);
                          });
                        },
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: restaurants.length,
                            itemBuilder: (context, index) {
                              var restaurantItem = restaurants[index];
                              return TileItemReview(
                                imageUrl:
                                    "https://restaurant-api.dicoding.dev/images/medium/${restaurantItem.pictureId}",
                                ctx: context,
                                title: restaurantItem.name,
                                subTitle: restaurantItem.city,
                                review: "${restaurantItem.rating}",
                                onTap: () {
                                  Navigator.pushNamed(context, "/detailScreen",
                                      arguments: restaurantItem.id);
                                },
                              );
                            }))
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator(color: Colors.black));
              }
            })
        );
  }
}
