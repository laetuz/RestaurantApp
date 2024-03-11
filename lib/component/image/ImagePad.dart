import 'package:flutter/material.dart';

class ImagePad extends StatelessWidget {
  final String url;
  final String? title;
  final String? subtitle;

  const ImagePad({super.key, required this.url, this.title, this.subtitle});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Stack(
        children: [
          Image.network(url),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title ?? ""),
                Text(subtitle ?? "", style: TextStyle(color: Colors.grey, fontSize: 12),)
              ],
            )
          )

        ],
      )
    );
  }
}