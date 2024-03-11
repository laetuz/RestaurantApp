import 'package:flutter/material.dart';

import 'NeoExpanded.dart';

class NeoItem extends StatelessWidget {
  final String image;
  final String title;
  final String desc;


  const NeoItem({super.key, required this.image, required this.title, required this.desc});


  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          NeoExpanded(flex: 1, widget: Image.network(image)),
          NeoExpanded(
              flex: 2,
              widget: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(desc)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}