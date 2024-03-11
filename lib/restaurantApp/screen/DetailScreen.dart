import 'package:flutter/material.dart';

import '../../component/image/ImagePad.dart';
import '../Restaurant.dart';

class DetailScreen extends StatelessWidget {

  final Restaurant restaurant;

  const DetailScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(restaurant.pictureId),
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
        )
    );
  }
}