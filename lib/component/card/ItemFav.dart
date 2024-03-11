import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemFav extends StatefulWidget {
  final String name;
  const ItemFav(this.name, {super.key});

  @override
  _ItemFavState createState() => _ItemFavState();

}

class _ItemFavState extends State<ItemFav> {
  bool _isFav = false;

  void toggleFav() {
    setState(() {
      _isFav = !_isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.name),
        trailing: IconButton(
          icon: Icon(
            _isFav ? Icons.favorite : Icons.favorite_border,
          ),
          onPressed: toggleFav,
        ),
      ),
    );
  }
  
}