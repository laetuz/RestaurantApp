import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../component/image/ImagePad.dart';
import '../data/controller/DetailController.dart';
import '../data/controller/LoadingState.dart';

class DetailScreen extends StatefulWidget {

  final String restaurantId;

  const DetailScreen({Key? key, required this.restaurantId}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
 // late Future<RestaurantDetail> restaurantDetail;
  final LoadingState _loadingState = Get.put(LoadingState());
  final DetailController _detailController = Get.put(DetailController());

  @override
  void initState() {
    super.initState();
    Get.delete<DetailController>();
    print("\n *** \n detail: ${_detailController.restaurantDetail.value} \n *** \n");
    _detailController.fetchRestaurantDetail(widget.restaurantId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => _loadingState.loading.value
            ? const Center(
            child: CircularProgressIndicator(color: Colors.black))
            : _detailController.errorMessage.value == null
            ? _widgetDetail()
            : const Center(
            child: Text(
              "Sorry, connection problem.",
              style: TextStyle(color: Colors.red),
            ))
        ));
  }

  Widget _widgetDetail() {
    if (_detailController.restaurantDetail.value == null) {
      return Center(
          child: CircularProgressIndicator(
              color: Colors
                  .black));
    } else {
      var restaurant = _detailController.restaurantDetail.value!.restaurant;
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Image.network(
                    "https://restaurant-api.dicoding.dev/images/medium/${restaurant
                        .pictureId}"),
                SafeArea(
                    child: ElevatedButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Icon(Icons.arrow_back))
                )

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.name, style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),),
                  Row(
                    children: [
                      Icon(Icons.location_city),
                      Text(restaurant.city)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star),
                      Text("${restaurant.rating}")
                    ],
                  ),
                  Divider(color: Colors.grey,),
                  Text(restaurant.description),
                  Divider(color: Colors.grey,),
                  SizedBox(
                      height: 150,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: restaurant.menus.foods.map((item) {
                            return ImagePad(
                              url: "https://luigispizzakenosha.com/wp-content/uploads/placeholder.png",
                              title: item.name,
                              subtitle: "Rp 25.000",
                            );
                          }).toList()
                      )),
                  SizedBox(
                      height: 150,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: restaurant.menus.drinks.map((item) {
                            return ImagePad(
                              url: "https://luigispizzakenosha.com/wp-content/uploads/placeholder.png",
                              title: item.name,
                              subtitle: "Rp 25.000",
                            );
                          }).toList()
                      ))
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}