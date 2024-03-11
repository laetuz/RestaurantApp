import 'package:flutter/material.dart';

class ListTileItem extends StatelessWidget {
  final BuildContext ctx;
  final String? imageUrl;
  final String? title;
  final String? subTitle;
  final VoidCallback? onTap;
  //final String image;
  //var articles = Element.article(f)

  const ListTileItem(
      {super.key,
      required this.ctx, this.onTap, this.title, this.imageUrl, this.subTitle});

  @override
  Widget build(BuildContext context) {
    const nullText = "";
    final defaultImage = imageUrl ?? nullText;
    final defaultTitle = title ?? nullText;
    final defaultDesc = subTitle ?? nullText;

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
      subtitle: Text(defaultDesc),
      onTap: onTap,
    );
  }
}
