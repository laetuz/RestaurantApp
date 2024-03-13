import 'package:flutter/material.dart';
import 'package:restaurant_app/restaurantApp/data/api/ApiService.dart';

import '../../component/image/ImagePad.dart';
import '../model/RestaurantDetail.dart';

class DetailScreen extends StatefulWidget {

  final String restaurantId;

  const DetailScreen({Key? key, required this.restaurantId}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<RestaurantDetail> restaurantDetail;

  @override
  void initState() {
    super.initState();
    restaurantDetail = ApiService().getDetail("${widget.restaurantId}");
  }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
        body: FutureBuilder<RestaurantDetail>(
          future: restaurantDetail,
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
              final restaurant = snapshot.data!.restaurant;
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: [
                        Image.network("https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}"),
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
                          Text(restaurant.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
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
            } else {
              return const Center(child: CircularProgressIndicator(color: Colors.black));
            }
          }  ,
        )
    );
  }
}