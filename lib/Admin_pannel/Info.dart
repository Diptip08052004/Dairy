import 'package:dairy/Room_Database/product.dart';
import 'package:flutter/cupertino.dart';

class Information extends StatelessWidget {
  const Information({super.key, required this.p,});

  final Product p;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(title: Text(p.name));
  }
}
