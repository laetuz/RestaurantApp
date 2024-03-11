import 'package:flutter/cupertino.dart';

class NeoExpanded extends StatelessWidget {
  final int flex;
  final Widget widget;
  const NeoExpanded({super.key, required this.flex, required this.widget});


  @override
  Widget build(BuildContext context) {
    return  Expanded(flex: flex, child: widget);
  }
}