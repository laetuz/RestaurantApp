import 'package:flutter/material.dart';
import 'package:restaurant_app/restaurantApp/data/api/ApiService.dart';
import 'package:restaurant_app/restaurantApp/model/RestaurantSearch.dart';

import '../../component/card/TileItemReview.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<RestaurantSearch> searchQuery;

  String inputQuery = "";

  @override
  void initState() {
    super.initState();
    searchQuery = ApiService().getSearch(inputQuery);
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
                return Text(
                    "Error: ${snapshot.error}"); // Handle error message (Widget)
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
                            inputQuery = value;
                            searchQuery = ApiService().getSearch(inputQuery);
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
                return CircularProgressIndicator(); // Show loading indicator (Widget)
              }
            })
        );
  }
}
