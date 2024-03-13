import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/restaurantApp/data/controller/LoadingState.dart';
import 'package:restaurant_app/restaurantApp/data/controller/SearchController.dart';

import '../../component/card/TileItemReview.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final LoadingState _loadingState = Get.put(LoadingState());
  final SearchStateController _searchController =
      Get.put(SearchStateController());


  @override
  void initState() {
    super.initState();
    Get.delete<SearchStateController>();
    _searchController.searchRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search"),
        ),
        body: Obx(() => _loadingState.loading.value
            ? const Center(
                child: CircularProgressIndicator(color: Colors.black))
            : _searchController.errorMessage.value == null
                ? _widgetMain()
                : const Center(
                    child: Text(
                    "Sorry, connection problem.",
                    style: TextStyle(color: Colors.red),
                  ))));
  }

  Widget _widgetMain() {
    print(
        "\n***\nsearch value: ${_searchController.restaurantSearch.value}\n***\n");

    if (_searchController.restaurantSearch.value == null) {
      return const Center(
          child: CircularProgressIndicator(color: Colors.black));
    } else {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
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
                  _searchController.query.value = value;
                  print("searchsstate" + _searchController.query.value);
                  _searchController.searchRestaurant();
                });
              },
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: _searchController
                      .restaurantSearch.value?.restaurants.length,
                  itemBuilder: (context, index) {
                    var restaurantItem = _searchController
                        .restaurantSearch.value?.restaurants[index];
                    if (_searchController
                        .restaurantSearch.value!.restaurants.isEmpty) {
                      return const Center(
                        child: Text(
                          "No restaurants available",
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    } else {
                      return TileItemReview(
                        imageUrl:
                            "https://restaurant-api.dicoding.dev/images/medium/${restaurantItem?.pictureId}",
                        ctx: context,
                        title: restaurantItem?.name,
                        subTitle: restaurantItem?.city,
                        review: "${restaurantItem?.rating}",
                        onTap: () {
                          Navigator.pushNamed(context, "/detailScreen",
                              arguments: restaurantItem?.id);
                        },
                      );
                    }
                  }))
        ],
      );
    }
  }
}
