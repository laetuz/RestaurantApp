import 'package:flutter/material.dart';

class TileItemReview extends StatelessWidget {
  final BuildContext ctx;
  final String? imageUrl;
  final String? title;
  final String? subTitle;
  final String? review;
  final VoidCallback? onTap;
  //final String image;
  //var articles = Element.article(f)

  const TileItemReview(
      {super.key,
        required this.ctx, this.onTap, this.title, this.imageUrl, this.subTitle, this.review});

  @override
  Widget build(BuildContext context) {
    const nullText = "";
    final defaultImage = imageUrl ?? nullText;
    final defaultTitle = title ?? nullText;
    final defaultDesc = subTitle ?? nullText;
    final reviewText = review ?? nullText;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Image.network(
        defaultImage,
        width: 100,
        errorBuilder: (ctxx, error, _) => const Center(
          child: Icon(Icons.error),
        ),
      ),
      title: Text(defaultTitle),
      subtitle: Column(
        children: [
          Row(
            children: [
              Icon(Icons.location_city),
              Text(defaultDesc)
            ],
          ),
          Row(
            children: [
              Icon(Icons.star),
              Text(reviewText)
            ],
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
